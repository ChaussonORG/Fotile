//
//  CommonPresentationController.swift
//  eGarage
//
//  Created by 陈克锋 on 2017/4/17.
//  Copyright © 2017年 陈克锋. All rights reserved.
//

import UIKit

enum CommonPresentedStyle {
    case rightToLeft
    case bottomToTop
}

/// 处理弹出框
class CommonPresentationController: UIPresentationController {
    
    var presentedWarpperView: UIView? // 被弹出的控制器视图
    var dimmngView: UIView?   // 阴影遮罩层
    
    var presentedStype: CommonPresentedStyle = CommonPresentedStyle.bottomToTop
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        presentedViewController.modalPresentationStyle = .custom
    }
    
    override var presentedView: UIView? {
        return presentedWarpperView
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        let presentedView = super.presentedView // presentedController的view
        
        let presentedWarpperView = UIView(frame: frameOfPresentedViewInContainerView)
        presentedWarpperView.layer.shadowRadius = 13.0
        presentedWarpperView.layer.shadowOpacity = 0.44
        presentedWarpperView.layer.shadowOffset = CGSize(width: 0, height: -6)
        self.presentedWarpperView = presentedWarpperView
        
        let presentationRoundedCornerView = UIView(frame: UIEdgeInsetsInsetRect(presentedWarpperView.bounds, UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0)))
        presentationRoundedCornerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        presentationRoundedCornerView.layer.cornerRadius = 2
        presentationRoundedCornerView.layer.masksToBounds = true
        
        let presentedViewControllerWrapperView = UIView(frame: UIEdgeInsetsInsetRect(presentationRoundedCornerView.bounds, UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)))
        presentedViewControllerWrapperView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        presentedView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        presentedView?.frame = presentedViewControllerWrapperView.bounds
        
        presentedViewControllerWrapperView.addSubview(presentedView ?? UIView())
        presentationRoundedCornerView.addSubview(presentedViewControllerWrapperView)
        presentedWarpperView.addSubview(presentationRoundedCornerView)
        
        let dimmingView = UIView(frame: containerView?.bounds ?? .zero)
        dimmingView.backgroundColor = UIColor.black
        dimmingView.isOpaque = false
        dimmingView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.dimmngView = dimmingView
        containerView?.addSubview(dimmingView)
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(dimmngViewDidTap(_:)))
        dimmingView.addGestureRecognizer(tapGes)
        
        let transitionCoordinator = presentingViewController.transitionCoordinator
        dimmingView.alpha = 0.0
        
        transitionCoordinator?.animate(alongsideTransition: { (_) in
            dimmingView.alpha = 0.5
        }, completion: nil)
        
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        if !completed {
            self.presentedWarpperView = nil
            self.dimmngView = nil
        }
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: {[weak self] (_) in
            self?.dimmngView?.alpha = 0.0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        if completed {
            self.dimmngView = nil
            self.presentedWarpperView = nil
        }
    }
    
    /// 布局
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        super.preferredContentSizeDidChange(forChildContentContainer: container)
        
        if container is UIViewController && (container as! UIViewController) == presentedViewController {
            containerView?.setNeedsLayout()
        }
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        if container is UIViewController && (container as! UIViewController) == presentedViewController {
            
            return presentedViewController.preferredContentSize
        }
        
        return super.size(forChildContentContainer: container, withParentContainerSize: parentSize)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        
        // 获取容器视图的bounds
        let containerViewBounds = containerView?.bounds ?? .zero
        // 获取被弹出控制器的size
        let presentedViewContentSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerViewBounds.size)
        
        var presentedControllerViewFrame = containerViewBounds
        
        switch presentedStype {
        case .bottomToTop:
            presentedControllerViewFrame.size.height = presentedViewContentSize.height
            presentedControllerViewFrame.origin.y = containerViewBounds.height - presentedViewContentSize.height
        case .rightToLeft:
            presentedControllerViewFrame.size.width = presentedViewContentSize.width
            presentedControllerViewFrame.origin.x = containerViewBounds.width - presentedViewContentSize.width
        }
        
        return presentedControllerViewFrame
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        dimmngView?.frame = containerView?.bounds ?? .zero
        presentedWarpperView?.frame = frameOfPresentedViewInContainerView
    }

    @objc private func dimmngViewDidTap(_ tapGes: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
}


extension CommonPresentationController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
 
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return self
    }
    
}

extension CommonPresentationController: UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionContext?.isAnimated ?? false ? 0.35 : 0.0
    }
    
    /// 核心动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let fromVC = transitionContext.viewController(forKey: .from) // 来源控制器
        let toVC = transitionContext.viewController(forKey: .to) // 目标控制器
        
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        
        let isPresented = fromVC! == presentingViewController
        
        // fromView最终的frame
        var fromViewFinalFrame = transitionContext.finalFrame(for: fromVC!)
        var toViewInitialFrame = transitionContext.initialFrame(for: toVC!)
        let toViewFinalFrame = transitionContext.finalFrame(for: toVC!)
        
        
        if isPresented {
            switch presentedStype {
            case .bottomToTop: // 在屏幕最下方
                toViewInitialFrame.origin = CGPoint(x: containerView.bounds.minX, y: containerView.bounds.maxY)
                toViewInitialFrame.size = toViewFinalFrame.size
                toView?.frame = toViewInitialFrame
            case .rightToLeft:
                // 在屏幕最右侧
                toViewInitialFrame.origin = CGPoint(x: containerView.bounds.maxX, y: 0)
                toViewInitialFrame.size = toViewFinalFrame.size
                toView?.frame = toViewInitialFrame
            }
            
        } else {
            // dismiss处理
            switch presentedStype {
            case .bottomToTop:
                // 屏幕最下方
                fromViewFinalFrame.origin = CGPoint(x: containerView.bounds.minX, y: containerView.bounds.maxY)
                fromViewFinalFrame.size = fromView?.frame.size ?? .zero
            case .rightToLeft:
                // 屏幕最右侧
                fromViewFinalFrame.origin = CGPoint(x: containerView.bounds.maxX, y: 0)
                fromViewFinalFrame.size = fromView?.frame.size ?? .zero
            }
        }
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        if toView != nil {
            containerView.addSubview(toView!)
        }
        
        UIView.animate(withDuration: transitionDuration, animations: {
            if isPresented {
                toView?.frame = toViewFinalFrame
            } else {
                fromView?.frame = fromViewFinalFrame
            }
            
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
