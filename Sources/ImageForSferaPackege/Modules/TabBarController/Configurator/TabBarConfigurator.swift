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
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter(interactor: interactor,
                                           router: router,
                                           output: output as? TabBarModuleOutput)
        presenter.view = viewController
        interactor.output = presenter
        viewController.output = presenter
        return viewController
    }
}
