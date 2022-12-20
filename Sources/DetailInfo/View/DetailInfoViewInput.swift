//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit
import Models

protocol DetailInfoViewInput: AnyObject {

    func setupInitialState(image: ImageDataInfo)
    
}
