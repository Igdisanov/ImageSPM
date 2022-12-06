//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

class AllImagePresenter: AllImageInteractorOutput {
    
    weak var view: AllImageViewInput!
    var interactor: AllImageInteractorInput!
    var router: AllImageRouterInput!
    var output: AllImageModuleOutput?
    
}

     //MARK:AllImageViewOutput

extension AllImagePresenter: AllImageViewOutput {
    func viewDidLoad() {
    }
}

     //MARK: AllImageModuleInput

extension AllImagePresenter: AllImageModuleInput {
    
}
