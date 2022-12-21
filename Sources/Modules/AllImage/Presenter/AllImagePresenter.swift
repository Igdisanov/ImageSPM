//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import Models
import UIKit
import DataKit

class AllImagePresenter: AllImageInteractorOutput {
    
    // MARK: - Public Properties
    
    weak var view: AllImageViewInput!
    var interactor: AllImageInteractorInput!
    var router: AllImageRouterInput!
    var output: AllImageModuleOutput?
    
    // MARK: - Private Properties
    
    private var images = [ImageDataInfo]() {
        didSet {
            self.view.setupInitialState(images: images)
        }
    }
}

     //MARK: - AllImageViewOutput

extension AllImagePresenter: AllImageViewOutput {
    
    func viewDidLoad() {
        
    }
    
    func requestImage(searchTerm: String? = nil) {
        interactor.fetchImages(searchTerm: searchTerm) { [weak self] (images) in
            guard let images = images else {return}
            self?.images = images
        }
    }
    
    func savePhotos(photos: [ImageDataInfo]) {
        interactor.savePhotos(photos: photos)
    }
    
    func getPhotos() {
        interactor.getPhotos()
    }
    
    func openDetailInfo(vc: UIViewController, image: ImageDataInfo){
        router.pushDetailVC(vc: vc, image: image)
    }
}

     //MARK: - AllImageModuleInput

extension AllImagePresenter: AllImageModuleInput {
    
}
