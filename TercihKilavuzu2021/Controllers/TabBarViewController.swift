//
//  TabBarViewController.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpControllers()
    }
    
    private func setUpControllers() {
        
        let homeVc = HomeViewController()
        homeVc.title = "Üniversiteler"
        homeVc.navigationItem.largeTitleDisplayMode = .always
        
        let favVc = FavoritesViewController()
        favVc.title = "Favoriler"
        favVc.navigationItem.largeTitleDisplayMode = .always
        
        let countdownVc = CountDownViewController()
        countdownVc.title = "Geri Sayım"
        countdownVc.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: homeVc)
        nav1.navigationBar.prefersLargeTitles = true
        nav1.tabBarItem = UITabBarItem(title: "Üniversiteler", image: UIImage(systemName: "building.columns.fill"), tag: 1)
        
        let nav2 = UINavigationController(rootViewController: favVc)
        nav2.navigationBar.prefersLargeTitles = true
        nav2.tabBarItem = UITabBarItem(title: "Favoriler", image: UIImage(systemName: "heart.fill"), tag: 2)
        
        let nav3 = UINavigationController(rootViewController: countdownVc)
        nav3.navigationBar.prefersLargeTitles = true
        nav3.tabBarItem = UITabBarItem(title: "Geri Sayım", image: UIImage(systemName: "timer"), tag: 3)
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }

}
