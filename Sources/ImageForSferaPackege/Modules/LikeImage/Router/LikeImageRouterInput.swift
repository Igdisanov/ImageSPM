//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import UIKit

protocol LikeImageRouterInput: AnyObject {
    func pushDetailVC(vc: UIViewController, image: ImageDataInfo)
}
