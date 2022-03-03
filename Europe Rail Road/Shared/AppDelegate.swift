//
//  AppDelegate.swift
//  Europe Rail Road (iOS)
//
//  Created by Felipe Muller  on 03/03/22.
//

import UIKit
import FirebaseMessaging
import Firebase
import FirebaseCrashlytics
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        #if DEBUG
            Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(false)
        #endif
        
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        
        subscribeToFcmTopic()
        
        return true
    }
    
    private func subscribeToFcmTopic() {
        let lang = Locale.current.languageCode!
        Messaging.messaging().subscribe(toTopic: "\(Constants.fcm_topic)" + "_" + "\(lang)")
    }
}
