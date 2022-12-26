//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//



final class DetailInfoPresenter {
    
    weak var view: DetailInfoViewInput?
    weak var moduleOutput: DetailInfoModuleOutput?
    
    private let interactor: DetailInfoInteractorInput
    private let router: DetailInfoRouterInput
    
    init(router: DetailInfoRouterInput, interactor: DetailInfoInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

     //MARK: - DetailInfoViewOutput

extension DetailInfoPresenter: DetailInfoViewOutput {
    func askImage() {
        interactor.getImage()
    }
    
}

     //MARK: - DetailInfoModuleInput

extension DetailInfoPresenter: DetailInfoModuleInput {
    
}

//MARK: - DetailInfoInteractorOutput

extension DetailInfoPresenter: DetailInfoInteractorOutput {
    func getImage(image: ImageDataInfo) {
        view?.setupInitialState(image: image)
    }
    
}
