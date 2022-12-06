//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 02.12.2022.
//

import UIKit
import AllImage
import LikeImage

public class TabBarController: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let allImageVC = setupVC(view: AllImageConfigurator.configure(output: nil),
                                 title: "All",
                                 image: "square.grid.3x3")
        
        let likeImageVC = setupVC(view: LikeImageConfigurator.configure(output: nil),
                                  title: "Like",
                                  image: "")
        viewControllers = [allImageVC, likeImageVC]
        
    }
    
    private func setupVC(view: UIViewController, title: String, image: String) -> UIViewController {
        let vc = view
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: image)
        return vc
    }
}
