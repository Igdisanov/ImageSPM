//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 02.12.2022.
//

import UIKit

public class TabBarController: UITabBarController {
    
    private let output: TabBarViewOutput
    
    init(output: TabBarViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.addViewControllers(view: self)
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
