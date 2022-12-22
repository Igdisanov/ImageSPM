//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
class AllImageConfigurator {
    
    static func configure(output: Any? = nil) -> AllImageViewController {
        
        let viewController = AllImageViewController()
        let router = AllImageRouter()
        let interactor = AllImageInteractor()
        let presenter = AllImagePresenter(interactor: interactor,
                                           router: router,
                                           output: output as? AllImageModuleOutput)
        presenter.view = viewController
        interactor.output = presenter
        interactor.networkDataFetcher = NetworkDataFetcher()
        viewController.output = presenter
        return viewController
    }
}
