//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

protocol TabBarViewOutput: AnyObject {
    func viewDidLoad()
    func addViewControllers(view: UITabBarController)
}

