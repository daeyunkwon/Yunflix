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
    
    func configureTabBar() {
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = true
        self.delegate = self
    }
    
    private func configureViewController() {
        //홈 컨트롤러
        let homeVC = makeNaviController(unselectedImage: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), rootViewController: HomeViewController())
        homeVC.tabBarItem.title = "홈"
        
        //회원가입 컨트롤러
        let signVC = makeController(tabBarTitle: "가입", unselectedImage: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"), rootViewController: SignViewController())
        
        //탭바 컨트롤러에 뷰 컨트롤러 추가
        self.viewControllers = [homeVC, signVC]
    }
    
    //MARK: - Functions
    
    private func makeController(tabBarTitle: String, unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UIViewController {
        let vc = rootViewController
        vc.tabBarItem.title = tabBarTitle
        vc.tabBarItem.image = unselectedImage
        vc.tabBarItem.selectedImage = selectedImage
        
        return vc
    }
    
    private func makeNaviController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        
        let naviVC = UINavigationController(rootViewController: rootViewController)
        naviVC.tabBarItem.image = unselectedImage
        naviVC.tabBarItem.selectedImage = selectedImage
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
