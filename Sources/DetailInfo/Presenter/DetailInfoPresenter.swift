//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

class DetailInfoPresenter: DetailInfoInteractorOutput {
    
    weak var view: DetailInfoViewInput!
    var interactor: DetailInfoInteractorInput!
    var router: DetailInfoRouterInput!
    var output: DetailInfoModuleOutput?
    
}

     //MARK:DetailInfoViewOutput

extension DetailInfoPresenter: DetailInfoViewOutput {
    func viewDidLoad() {
    }
}

     //MARK: DetailInfoModuleInput

extension DetailInfoPresenter: DetailInfoModuleInput {
    
}
