//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


final class DetailInfoInteractor {
    
    weak var output: DetailInfoInteractorOutput?
    private let context: DetailInfoContext?
    
    init(context: DetailInfoContext) {
        self.context = context
    }
}

     //MARK: - DetailInfoInteractorInput

extension DetailInfoInteractor: DetailInfoInteractorInput {
    func getImage() {
        guard let image = self.context?.image else {return}
        output?.getImage(image: image)
    }
    
    
}
