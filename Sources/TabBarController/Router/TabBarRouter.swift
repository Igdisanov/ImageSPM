//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import AllImage
import LikeImage

class TabBarRouter: TabBarRouterInput {
    
    weak var view: TabBarViewInput?
    
    func creatViewControllers() {
        
        let allImageVC = setupVC(view: AllImageConfigurator.configure(output: nil),
                                 title: "All",
                                 image: "square.grid.3x3")
        
        let likeImageVC = setupVC(view: LikeImageConfigurator.configure(output: nil),
                                  title: "Like",
                                  image: "")
        view?.returnView().viewControllers = [allImageVC, likeImageVC]
    }
    
    private func setupVC(view: UIViewController, title: String, image: String) -> UIViewController {
        let vc = UINavigationController(rootViewController: view)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: image)
        return vc
    }
    
}
