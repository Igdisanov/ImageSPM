//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import Models
import UIKit
import DetailInfo

@available(iOS 13.0, *)
class LikeImageRouter: LikeImageRouterInput {
    
    weak var view: LikeImageViewInput?
    
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo) {
        let detailVC = DetailInfoConfigurator.configure(image: image)
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
