//
//  SearchCoordinator.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/7/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit


class SearchCoordinator: Coordinator {
    //private let presenter: UITabBarController
    private var searchViewController: SearchViewController?
    
    public var rootViewController: UIViewController {
        return searchViewController!
    }
    
    init() {
        let searchViewController = SearchViewController(nibName: nil, bundle: nil) // 6
        searchViewController.title = "Search"
        self.searchViewController = searchViewController
    }
    
    func start() {
    }
}
