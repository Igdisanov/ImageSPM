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
    func viewDidLoad() {
    }
    func viewWillAppear() {
        let images = self.interactor.getImage()
        view.setSavedImages(images: images)
    }
    
    func deleteImage(image: ImageInfo) {
        interactor.deleteImage(image: image)
    }
}

     //MARK: LikeImageModuleInput

extension LikeImagePresenter: LikeImageModuleInput {
    
}

