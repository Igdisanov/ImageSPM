//
//  AllImageContainer.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
final class AllImageContainer {
    
    let input: AllImageModuleInput
    let viewController: UIViewController
    private(set) weak var router: AllImageRouterInput?
    
    static func assemble(with context: AllImageContext) -> AllImageContainer {
        let router = AllImageRouter()
        let interactor = AllImageInteractor(networkDataFetcher: NetworkDataFetcher())
        let presenter = AllImagePresenter(router: router, interactor: interactor)
        let viewController = AllImageViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        interactor.output = presenter
        
        return AllImageContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: AllImageModuleInput, router: AllImageRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct AllImageContext {
    weak var moduleOutput: AllImageModuleOutput?
}
