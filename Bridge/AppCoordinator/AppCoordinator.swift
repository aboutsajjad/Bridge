//
//  AppCoordinator.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/7/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UITabBarController
    let downloadCoordinator: DownloadCoordinator
    
    init(window: UIWindow) {
        self.window = window
        
        rootViewController = UITabBarController()
        
        
        let searchCoordinator = SearchCoordinator()
        downloadCoordinator = DownloadCoordinator()
        
        
        var controllers: [UIViewController] = []
        
        let searchViewController = searchCoordinator.rootViewController
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
        searchCoordinator.searchViewController.downloadManager = downloadCoordinator.downloadDelegate.downloadManager
       
        let downloadViewController = downloadCoordinator.rootViewController
        downloadViewController.tabBarItem = UITabBarItem(title: "Download", image: nil, selectedImage: nil)
        
       
        
        controllers.append(searchViewController)
        controllers.append(downloadViewController)
        
        rootViewController.viewControllers = controllers
        rootViewController.tabBar.isTranslucent = false
        //tabController.delegate = self
        
        
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
