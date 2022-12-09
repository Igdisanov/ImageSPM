//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

public class AllImageViewController: UICollectionViewController {
    
    var output: AllImageViewOutput!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}

     //MARK: AllImageViewInput

extension AllImageViewController: AllImageViewInput {
    
    func setupInitialState() {
        
    }
}
