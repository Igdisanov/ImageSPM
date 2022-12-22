//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import UIKit

@available(iOS 13.0, *)
class LikeImageRouter: LikeImageRouterInput {
    
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo) {
        let detailVC = DetailInfoConfigurator.configure(image: image)
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
