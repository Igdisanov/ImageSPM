//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import DataKit
import Models

open class DetailInfoConfigurator {
    
    public static func configure(output: Any? = nil, image: ImageDataInfo) -> DetailInfoViewController {
        
        let viewController = DetailInfoViewController()
        
        let router = DetailInfoRouter()
        router.view = viewController
        
        let presenter = DetailInfoPresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.output = output as? DetailInfoModuleOutput
        presenter.image = image
        
        let interactor = DetailInfoInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter 
        
        return viewController
    }
}
