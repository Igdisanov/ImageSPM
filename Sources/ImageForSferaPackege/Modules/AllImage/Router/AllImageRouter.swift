//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

final class AllImageRouter {
}

extension AllImageRouter: AllImageRouterInput {
    
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo) {
        let context =  DetailInfoContext(image: image)
        let detailVC = DetailInfoContainer.assemble(with: context)
        vc.navigationController?.pushViewController(detailVC.viewController, animated: true)
    }
}


