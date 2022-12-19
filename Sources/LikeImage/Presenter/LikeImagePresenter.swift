//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit

class LikeImagePresenter: LikeImageInteractorOutput {
    
    weak var view: LikeImageViewInput!
    var interactor: LikeImageInteractorInput!
    var router: LikeImageRouterInput!
    var output: LikeImageModuleOutput?
    
}

     //MARK:LikeImageViewOutput

extension LikeImagePresenter: LikeImageViewOutput {
    
    func deleteImage(image: ImageInfo) {
        self.interactor.deleteImage(image: image)
    }
    
    func viewDidLoad() {
    }
}

     //MARK: LikeImageModuleInput

extension LikeImagePresenter: LikeImageModuleInput {
    
}

