//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
final class TabBarRouter {
}

extension TabBarRouter: TabBarRouterInput {
    
    func creatViewControllers(view: UITabBarController) {
        
        let AllImageViewController = AllImageContainer.assemble(with: AllImageContext.init())
        let allImageVC = setupVC(view: AllImageViewController.viewController,
                                 title: "All",
                                 image: "rectangle.3.group")
        
        let likeImageViewController = LikeImageContainer.assemble(with: LikeImageContext.init())
        let likeImageVC = setupVC(view: likeImageViewController.viewController,
                                  title: "Like",
                                  image: "suit.heart")
        view.viewControllers = [allImageVC, likeImageVC]
    }
    
    private func setupVC(view: UIViewController, title: String, image: String) -> UIViewController {
        let vc = UINavigationController(rootViewController: view)
        vc.tabBarItem.title = title
        
        vc.tabBarItem.image = UIImage(systemName: image)
        
        return vc
    }
}
