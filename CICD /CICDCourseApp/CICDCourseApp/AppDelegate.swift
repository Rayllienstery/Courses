//
//  AppDelegate.swift
//  CICDCourseApp
//
//  Created by Konstantin Kolosov on 12.02.2024.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = AppCenterDelegate.shared
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

private final class AppCenterDelegate {
    static let shared = AppCenterDelegate.init()

    private let secretCode = "f0d2b9c7-cc50-4edf-a634-a8be18d081ab"
    private init() {
        AppCenter.start(withAppSecret: secretCode, services:[
          Analytics.self,
          Crashes.self
        ])
        debugPrint("App Center Initialized")
    }
}
