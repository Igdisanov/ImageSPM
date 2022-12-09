//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

open class AllImageConfigurator {
    
    public static func configure(output: Any? = nil) -> AllImageViewController {
        
        let viewController = AllImageViewController(collectionViewLayout: UICollectionViewLayout())
        
        let router = AllImageRouter()
        router.view = viewController
        
        let presenter = AllImagePresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.output = output as? AllImageModuleOutput
        
        let interactor = AllImageInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        
        return viewController
    }
}
