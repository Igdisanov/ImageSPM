//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

public class LikeImageViewController: UITableViewController {
    
    var output: LikeImageViewOutput!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
}

     //MARK: LikeImageViewInput

extension LikeImageViewController: LikeImageViewInput {
    
    func setupInitialState() {
        
    }
}
