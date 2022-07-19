//
//  WhereWeGoAppiOSApp.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 05/07/22.
//

import SwiftUI

@main
struct WhereWeGoAppiOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .portrait
                }).onDisappear(perform: {
                    AppDelegate.orientationLock = .all
                })
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
