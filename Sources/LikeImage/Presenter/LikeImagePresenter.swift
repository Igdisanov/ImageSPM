//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

class LikeImagePresenter: LikeImageInteractorOutput {
    
    weak var view: LikeImageViewInput!
    var interactor: LikeImageInteractorInput!
    var router: LikeImageRouterInput!
    var output: LikeImageModuleOutput?
    
}

     //MARK:LikeImageViewOutput

extension LikeImagePresenter: LikeImageViewOutput {
    func viewDidLoad() {
    }
}

     //MARK: LikeImageModuleInput

extension LikeImagePresenter: LikeImageModuleInput {
    
}

