//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

class TabBarPresenter: TabBarInteractorOutput {
    
    weak var view: TabBarViewInput?
    weak var moduleOutput: TabBarModuleOutput?
    
    private let router: TabBarRouterInput
    private let interactor: TabBarInteractorInput
    
    init(router: TabBarRouterInput, interactor: TabBarInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
}

     //MARK: TabBarViewOutput

extension TabBarPresenter: TabBarViewOutput {
    func viewDidLoad() {
    }
    
    func addViewControllers(view: UITabBarController) {
        router.creatViewControllers(view: view)
    }
}

     //MARK: TabBarModuleInput

extension TabBarPresenter: TabBarModuleInput {
    
}
