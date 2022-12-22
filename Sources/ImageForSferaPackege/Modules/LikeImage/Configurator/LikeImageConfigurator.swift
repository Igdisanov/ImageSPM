//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
class LikeImageConfigurator {
    
    static func configure(output: Any? = nil) -> LikeImageViewController {
        
        let viewController = LikeImageViewController()
        let router = LikeImageRouter()
        let interactor = LikeImageInteractor()
        let presenter = LikeImagePresenter(interactor: interactor,
                                           router: router,
                                           output: output as? LikeImageModuleOutput)
        presenter.view = viewController
        interactor.output = presenter
        viewController.output = presenter
        return viewController
    }
}
