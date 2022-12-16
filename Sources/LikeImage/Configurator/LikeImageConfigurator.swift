//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
open class LikeImageConfigurator {
    
    public static func configure(output: Any? = nil) -> LikeImageViewController {
        
        let viewController = LikeImageViewController()
        
        let router = LikeImageRouter()
        router.view = viewController
        
        let presenter = LikeImagePresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.output = output as? LikeImageModuleOutput
        
        let interactor = LikeImageInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        
        return viewController
    }
}
