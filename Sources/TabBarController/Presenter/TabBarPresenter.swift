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
    
}

     //MARK: TabBarViewOutput

extension TabBarPresenter: TabBarViewOutput {
    func viewDidLoad() {
    }
}

     //MARK: TabBarModuleInput

extension TabBarPresenter: TabBarModuleInput {
    
}
