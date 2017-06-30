//
//  AppDelegate.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var tabbar:UITabBarController?
    var ftView:FTTabbarView?
    var isAllow:Bool = false
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        setUM()
        if FTUserManager.userManager.isLogin() {
            login()
        }else{
            logOut()
        }
        return true
    }
    func setUM(){
        UMAnalyticsConfig.sharedInstance().appKey = "5954adb465b6d65d5b000784"
        UMAnalyticsConfig.sharedInstance().channelId = "App Store"
        MobClick.start(withConfigure: UMAnalyticsConfig.sharedInstance())
    }
    func logOut() {
        let story = UIStoryboard(name: "Login", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "FTLogin")
        self.window?.rootViewController = vc

    }
    func login() {
        let story:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        tabbar = story.instantiateViewController(withIdentifier: "tabbarRoot") as? UITabBarController
        self.window?.rootViewController = tabbar
        tabbar?.tabBar.isHidden = true
        ftView =  FTTabbarView(frame: CGRect.zero)
        self.window?.addSubview(ftView!)
        ftView?.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(49)
        }
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if isAllow {
            return .all
        }
        return .portrait
    }

}

