//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

public class LikeImageViewController: UIViewController {
    
    var output: LikeImageViewOutput!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
}

     //MARK: AllImageViewInput

extension LikeImageViewController: LikeImageViewInput {
    
    func setupInitialState() {
        
    }
}
