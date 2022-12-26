//
//  DetailInfoContainer.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

final class DetailInfoContainer {
    
    let input: DetailInfoModuleInput
    let viewController: UIViewController
    private(set) weak var router: DetailInfoRouterInput?
    
    static func assemble(with context: DetailInfoContext) -> DetailInfoContainer {
        
        let router = DetailInfoRouter()
        let interactor = DetailInfoInteractor(context: context)
        let presenter = DetailInfoPresenter(router: router, interactor: interactor)
        let viewController = DetailInfoViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        interactor.output = presenter
        
        return DetailInfoContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: DetailInfoModuleInput, router: DetailInfoRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct DetailInfoContext {
    weak var moduleOutput: DetailInfoModuleOutput?
    let image: ImageDataInfo?
}
