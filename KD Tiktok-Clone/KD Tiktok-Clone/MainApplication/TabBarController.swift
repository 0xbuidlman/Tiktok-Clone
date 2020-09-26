//
//  TabbarController.swift
//  KD Tiktok-Clone
//
//  Created by Sam Ding on 9/8/20.
//  Copyright © 2020 Kaishan. All rights reserved.
//

import Foundation
import UIKit

class TabBarController:  UITabBarController, UITabBarControllerDelegate {
    
    var homeNavigationController: BaseNavigationController!
    var homeViewController: HomeViewController!
    var discoverViewController: DiscoverViewController!
    var mediaViewController: MediaViewController!
    var inboxViewController: InboxViewController!
    var profileViewController: ProfileViewController!

    
    //MARK: - LifeCycles
    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .white
        
        homeViewController = HomeViewController()
        homeNavigationController = BaseNavigationController()
        homeNavigationController.viewControllers = [homeViewController]
        discoverViewController = DiscoverViewController()
        mediaViewController = MediaViewController()
        inboxViewController = InboxViewController()
        profileViewController = ProfileViewController()
     
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        discoverViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        discoverViewController.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass")
        
        mediaViewController.tabBarItem.image = UIImage(systemName: "plus.square")
        mediaViewController.tabBarItem.selectedImage = UIImage(systemName: "plus.square.fill")
        
        inboxViewController.tabBarItem.image = UIImage(systemName: "text.bubble")
        inboxViewController.tabBarItem.selectedImage = UIImage(systemName: "text.bubble.fill")
        
        profileViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        profileViewController.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        
        viewControllers = [homeNavigationController, discoverViewController, mediaViewController, inboxViewController, profileViewController]
        
        let tabBarItemTitle = ["Home", "Discover", "Add", "Inbox", "Me"]
        
        for (index, tabBarItem) in tabBar.items!.enumerated() {
            tabBarItem.title = tabBarItemTitle[index]
            //tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    //MARK: UITabbar Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      if viewController.isKind(of: MediaViewController.self) {
         let vc =  MediaViewController()
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated: true, completion: nil)
         return false
      }
      return true
    }
    
}
