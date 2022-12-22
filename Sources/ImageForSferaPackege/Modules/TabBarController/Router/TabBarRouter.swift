//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
class TabBarRouter: TabBarRouterInput {
    
    weak var view: TabBarViewInput?
    
    func creatViewControllers() {
        
        let allImageVC = setupVC(view: AllImageConfigurator.configure(output: nil),
                                 title: "All",
                                 image: "rectangle.3.group")
        
        let likeImageVC = setupVC(view: LikeImageConfigurator.configure(output: nil),
                                  title: "Like",
                                  image: "suit.heart")
        view?.returnView().viewControllers = [allImageVC, likeImageVC]
    }
    
    private func setupVC(view: UIViewController, title: String, image: String) -> UIViewController {
        let vc = UINavigationController(rootViewController: view)
        vc.tabBarItem.title = title
        
        vc.tabBarItem.image = UIImage(systemName: image)
        
        return vc
    }
    
}
