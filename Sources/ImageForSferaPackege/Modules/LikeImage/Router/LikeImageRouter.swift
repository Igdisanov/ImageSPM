//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import UIKit

@available(iOS 13.0, *)
final class LikeImageRouter {
    
}

extension LikeImageRouter: LikeImageRouterInput {
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo) {
        let detailVC = DetailInfoContainer.assemble(with: DetailInfoContext.init())
        vc.navigationController?.pushViewController(detailVC.viewController, animated: true)
    }
}
