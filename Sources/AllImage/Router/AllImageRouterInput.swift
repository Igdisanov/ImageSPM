//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import DataKit
import Models

protocol AllImageRouterInput {
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo)
}
