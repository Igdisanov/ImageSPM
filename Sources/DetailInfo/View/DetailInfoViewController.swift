//
//  File.swift
//
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit

public class DetailInfoViewController: UIViewController {
    
    var output: DetailInfoViewOutput!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
}

//MARK: DetailInfoViewInput

extension DetailInfoViewController: DetailInfoViewInput {
    
    func setupInitialState() {
        
    }
}
