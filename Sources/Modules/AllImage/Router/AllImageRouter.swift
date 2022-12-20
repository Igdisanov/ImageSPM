//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//
import DetailInfo
import UIKit
import DataKit
import Models

class AllImageRouter: AllImageRouterInput {
    
    weak var view: AllImageViewInput?
    
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo) {
        let detailVC = DetailInfoConfigurator.configure(image: image)
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
}
