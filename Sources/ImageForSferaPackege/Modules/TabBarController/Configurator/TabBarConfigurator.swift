//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
open class TabBarConfigurator {
    
    public static func configure(output: Any?) -> TabBarController {
        
        let viewController = TabBarController()
        
        let router = TabBarRouter()
        router.view = viewController
        
        let presenter = TabBarPresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.output = output as? TabBarModuleOutput
        
        let interactor = TabBarInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        
        return viewController
    }
}