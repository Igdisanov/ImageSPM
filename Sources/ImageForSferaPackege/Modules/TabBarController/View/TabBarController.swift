//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 02.12.2022.
//

import UIKit

public class TabBarController: UITabBarController {
    
    var output: TabBarViewOutput!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewDidLoad()
    }
}

//MARK: TabBarViewInput

extension TabBarController: TabBarViewInput {
    
    func setupInitialState() {
    }
    
    func returnView() -> UITabBarController {
        return self
    }
}
