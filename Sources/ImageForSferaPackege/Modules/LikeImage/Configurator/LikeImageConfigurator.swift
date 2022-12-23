//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

@available(iOS 13.0, *)
final class LikeImageContainer {
    let input: LikeImageModuleInput
    let viewController: UIViewController
    private(set) weak var router: LikeImageRouterInput?

    static func assemble(with context: LikeImageContext) -> LikeImageContainer {
        let router = LikeImageRouter()
        let interactor = LikeImageInteractor()
        let presenter = LikeImagePresenter(router: router, interactor: interactor)
        let viewController = LikeImageViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput

        interactor.output = presenter

        return LikeImageContainer(view: viewController, input: presenter, router: router)
    }

    private init(view: UIViewController, input: LikeImageModuleInput, router: LikeImageRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct LikeImageContext {
    weak var moduleOutput: LikeImageModuleOutput?
}
