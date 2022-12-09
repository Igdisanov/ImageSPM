//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

protocol TabBarViewInput: AnyObject {
    func viewDidLoad()
    func returnView() -> UITabBarController
}

