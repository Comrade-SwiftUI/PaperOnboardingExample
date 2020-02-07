//
//  AppDelegate.swift
//  PaperOnboardingExample
//
//  Created by Bhavesh Chavda on 05/02/20.
//  Copyright © 2020 BhaveshChavda. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var locationManager: CLLocationManager!
    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        showOnboardingPage()
        return true
    }
    
    /// Display the onboarding page for first time user
    private func showOnboardingPage(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window{
            let destinationVC = OnboardingViewController()
            window.rootViewController = destinationVC
            window.makeKeyAndVisible()
        }
    }
}

