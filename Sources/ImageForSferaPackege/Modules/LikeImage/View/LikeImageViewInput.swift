//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//



@available(iOS 13.0, *)
protocol LikeImageViewInput: AnyObject {
    func viewDidLoad()
    func setupInitialState(provider: EmployeeProvider?)
}
