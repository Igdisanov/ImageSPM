//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import UIKit

final class AllImagePresenter: AllImageInteractorOutput {
    
    // MARK: - Public Properties
    
    weak var view: AllImageViewInput?
    weak var moduleOutput: AllImageModuleOutput?
    
    // MARK: - Privaet Properties
    
    private let router: AllImageRouterInput
    private let interactor: AllImageInteractorInput
    
    // MARK: - Private Properties
    
    private var images = [ImageDataInfo]() {
        didSet {
            self.view?.setupInitialState(images: images)
        }
    }
    
    init(router: AllImageRouterInput, interactor: AllImageInteractorInput) {
        self.router = router
        self.interactor = interactor
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
