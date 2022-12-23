//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import CoreData
import UIKit

@available(iOS 13.0, *)
final class LikeImagePresenter {
    
    weak var view: LikeImageViewInput?
    weak var moduleOutput: LikeImageModuleOutput?
    
    private let router: LikeImageRouterInput
    private let interactor: LikeImageInteractorInput
    
    private var provider: EmployeeProvider?
    
    init(router: LikeImageRouterInput, interactor: LikeImageInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

     //MARK: - LikeImageViewOutput

@available(iOS 13.0, *)
extension LikeImagePresenter: LikeImageViewOutput {
    
    func getImages(with: NSFetchedResultsControllerDelegate) {
        self.provider = interactor.getImage(with: with)
        view?.setupInitialState(provider: provider)
    }
    
    func deleteImage(image: ImageInfo) {
        self.interactor.deleteImage(image: image)
    }
    
    func openDetailInfo(vc: UIViewController, image: ImageDataInfo){
        router.pushDetailVC(vc: vc, image: image)
    }
    
    func viewDidLoad() {
    }
}

     //MARK: - LikeImageModuleInput

@available(iOS 13.0, *)
extension LikeImagePresenter: LikeImageModuleInput {
    
}

//MARK: - LikeImageInteractorOutput

extension LikeImagePresenter: LikeImageInteractorOutput {
}

