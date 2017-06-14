//
//  UIBarButtonItem+Extension.swift
//  eGarage
//
//  Created by 陈克锋 on 2017/3/8.
//
//

import UIKit

extension UIBarButtonItem {

    static func backBarItem(_ disposeBag: DisposeBag, _ click: (()->())?) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.sizeToFit()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        
        button.rx.tap.subscribe(onNext: { _ in
            guard let click = click else { return }
            click()
        }).addDisposableTo(disposeBag)
        
        let barItem = UIBarButtonItem(customView: button)
        
        return barItem
    }
    
    static func navigationTitle(_ title: String, color: UIColor ) -> UILabel {
        let label = UILabel()
        label.text = title
        //label.font = Style.font18
        label.textColor = color
        label.sizeToFit()
        return label
    }

    
    
    static func barButtonItem(_ disposeBag: DisposeBag, _ title: String?, _ click:(()->())?) -> UIBarButtonItem {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
//        button.setTitleColor(Style.color333, for: .normal)
//        button.setTitleColor(Style.color333.withAlphaComponent(0.5), for: .highlighted)
//        button.titleLabel?.font = Style.font16
        button.sizeToFit()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        
        button.rx.tap.subscribe(onNext: { _ in
            guard let click = click else { return }
            click()
        }).addDisposableTo(disposeBag)
        
        return UIBarButtonItem(customView: button)
    }
    
    static func closeButtonItem(_ disposeBag: DisposeBag, _ click: (() -> ())?) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icon_return"), for: .normal)
        button.sizeToFit()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        button.rx.tap.subscribe(onNext: { _ in
            guard let click = click else {return}
            click()
        }).addDisposableTo(disposeBag)
        
        return UIBarButtonItem(customView: button)
    }
    
}

