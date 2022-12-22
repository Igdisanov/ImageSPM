//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

class TabBarPresenter: TabBarInteractorOutput {
    
    weak var view: TabBarViewInput!
    var interactor: TabBarInteractorInput!
    var router: TabBarRouterInput!
    var output: TabBarModuleOutput?
    
    init(interactor: TabBarInteractorInput!, router: TabBarRouterInput!, output: TabBarModuleOutput? = nil) {
        self.interactor = interactor
        self.router = router
        self.output = output
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
