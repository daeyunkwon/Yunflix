//
//  MainTabBarController.swift
//  Yunflix
//
//  Created by 권대윤 on 6/4/24.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureViewController()
    }
    
    private func configureTabBar() {
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.tintColor = .white
        tabBar.isTranslucent = true
        delegate = self
    }
    
    private func configureViewController() {
        //홈
        let homeVC = makeNaviController(tabBarTitle: "홈", unselectedImage: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), rootViewController: HomeViewController())
        
        //회원가입
        let signVC = makeController(tabBarTitle: "가입", unselectedImage: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"), rootViewController: SignViewController())
        
        self.viewControllers = [homeVC, signVC]
    }
    
    //MARK: - Functions
    
    private func makeController(tabBarTitle: String, unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UIViewController {
        let vc = rootViewController
        vc.tabBarItem = UITabBarItem(title: tabBarTitle, image: unselectedImage, selectedImage: selectedImage)
        
        return vc
    }
    
    private func makeNaviController(tabBarTitle: String, unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let naviVC = UINavigationController(rootViewController: rootViewController)
        naviVC.tabBarItem = UITabBarItem(title: tabBarTitle, image: unselectedImage, selectedImage: selectedImage)
        
        naviVC.navigationBar.tintColor = .white
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .light)
        naviVC.navigationBar.isTranslucent = true
        naviVC.navigationBar.standardAppearance = appearance
        naviVC.navigationBar.scrollEdgeAppearance = appearance
        
        return naviVC
    }
}

//MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    
}
