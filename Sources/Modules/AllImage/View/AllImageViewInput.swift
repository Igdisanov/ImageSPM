//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import Models

protocol AllImageViewInput: AnyObject {
    func setupInitialState(images: [ImageDataInfo])
}
