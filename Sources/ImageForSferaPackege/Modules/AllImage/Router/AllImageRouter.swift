//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

class AllImageRouter: AllImageRouterInput {
    
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo) {
        let detailVC = DetailInfoConfigurator.configure(image: image)
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
}
