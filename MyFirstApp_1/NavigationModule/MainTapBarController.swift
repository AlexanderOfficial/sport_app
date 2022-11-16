//
//  MainTapBarController.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 18.10.2022.
//

import UIKit


class MainTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar(){
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems(){
        let mainVC = MainViewController()
        let statisticVC = StatisticsViewController()
        
        setViewControllers([mainVC, statisticVC], animated: true)
        
        guard let items = tabBar.items else {return}
        items[0].title = "Main"
        items[1].title = "Statictic"
        
        items[0].image = UIImage(named: "Vector")
        items[1].image = UIImage(named: "Filter 5")
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Roboto-Bold", size: 12) as Any,
                                                          
                                                         
                                                         ], for: .normal)
        
    }
}
