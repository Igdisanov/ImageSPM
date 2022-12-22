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
    
    var image: ImageDataInfo! {
        didSet{
            view.setupInitialState(image: image)
        }
    }
    
    init( interactor: DetailInfoInteractorInput!, router: DetailInfoRouterInput!, output: DetailInfoModuleOutput? = nil) {
        self.interactor = interactor
        self.router = router
        self.output = output
    }
}

     //MARK:DetailInfoViewOutput

extension DetailInfoPresenter: DetailInfoViewOutput {
    func viewDidLoad() {
    }
}

     //MARK: DetailInfoModuleInput

extension DetailInfoPresenter: DetailInfoModuleInput {
    
}
