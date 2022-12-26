//
//  TabBarContainer.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
open class TabBarContainer {
    
    let input: TabBarModuleInput
    public let viewController: UIViewController
    private(set) weak var router: TabBarRouterInput?

    public static func assemble(with context: TabBarContext) -> TabBarContainer {
        let router = TabBarRouter()
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter(router: router, interactor: interactor)
        let viewController = TabBarController(output: presenter)

        presenter.view = viewController
        router.view = viewController
        presenter.moduleOutput = context.moduleOutput
        interactor.output = presenter

        return TabBarContainer(view: viewController, input: presenter, router: router)
    }

    private init(view: UIViewController, input: TabBarModuleInput, router: TabBarRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

public struct TabBarContext {
    weak var moduleOutput: TabBarModuleOutput?
    public init() {}
}

