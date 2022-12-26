//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

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
        router.creatViewControllers()
    }
}

     //MARK: TabBarModuleInput

extension TabBarPresenter: TabBarModuleInput {
    
}
