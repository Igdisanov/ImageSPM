//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit
import CoreData
import Models
import UIKit

@available(iOS 13.0, *)
class LikeImagePresenter: LikeImageInteractorOutput {
    
    weak var view: LikeImageViewInput!
    var interactor: LikeImageInteractorInput!
    var router: LikeImageRouterInput!
    var output: LikeImageModuleOutput?
    private var provider: EmployeeProvider?
}

     //MARK: - LikeImageViewOutput

@available(iOS 13.0, *)
extension LikeImagePresenter: LikeImageViewOutput {
    
    func getImages(with: NSFetchedResultsControllerDelegate) {
        self.provider = interactor.getImage(with: with)
        view.setupInitialState(provider: provider)
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

