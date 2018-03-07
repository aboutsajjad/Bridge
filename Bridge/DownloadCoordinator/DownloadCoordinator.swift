//
//  DownloadCoordinator.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/7/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//


import UIKit


class DownloadCoordinator: Coordinator {
    //private let presenter: UITabBarController
    private var downloadViewController: DownloadViewController?
    
    public var rootViewController: UIViewController {
        return downloadViewController!
    }
    
    init() {
        let downloadViewController = DownloadViewController(nibName: nil, bundle: nil) // 6
        downloadViewController.title = "Download"
        self.downloadViewController = downloadViewController
    }
    
    func start() {
    }
}
