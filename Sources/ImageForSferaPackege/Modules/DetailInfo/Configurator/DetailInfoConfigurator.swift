//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

class DetailInfoConfigurator {
    
   static func configure(image: ImageDataInfo, output: Any? = nil) -> DetailInfoViewController {
       
        let viewController = DetailInfoViewController()
        let router = DetailInfoRouter()
        let interactor = DetailInfoInteractor()
        let presenter = DetailInfoPresenter(interactor: interactor,
                                            router: router,
                                            output: output as? DetailInfoModuleOutput)
        presenter.view = viewController
        interactor.output = presenter
        viewController.output = presenter 
        presenter.image = image
        return viewController
    }
}
