//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit
import Models

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
}

     //MARK:DetailInfoViewOutput

extension DetailInfoPresenter: DetailInfoViewOutput {
    func viewDidLoad() {
    }
}

     //MARK: DetailInfoModuleInput

extension DetailInfoPresenter: DetailInfoModuleInput {
    
}
