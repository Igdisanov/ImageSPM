//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

open class TabBarConfigurator {
    
    public static func configure(output: Any? = nil) -> TabBarController {
        
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
