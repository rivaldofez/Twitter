//
//  ViewController.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 31/01/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let notificationVC = UINavigationController(rootViewController: NotificationViewController())
        let directMessageVC = UINavigationController(rootViewController: DirectMessageViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        
        notificationVC.tabBarItem.image = UIImage(systemName: "bell")
        notificationVC.tabBarItem.image = UIImage(systemName: "bell.fill")
        
        directMessageVC.tabBarItem.image = UIImage(systemName: "envelope")
        directMessageVC.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([
            homeVC,
            searchVC,
            notificationVC,
            directMessageVC
        ], animated: true)
        
        
    }


}

