//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import Models
import CoreData

public class LikeImageViewController: UIViewController {
    
    var output: LikeImageViewOutput!
    let imageTableView = UITableView()
    private var savedPhotos = [String]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(imageTableView)
        imageTableView.dataSource = self
        imageTableView.delegate = self
        
        imageTableView.register(ImageTableCell.self, forCellReuseIdentifier: ImageTableCell.className)
        
        imageTableView.translatesAutoresizingMaskIntoConstraints = false
        imageTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        imageTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

//MARK: - LikeImageViewInput

extension LikeImageViewController: LikeImageViewInput {
    
    func setupInitialState() {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension LikeImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.className, for: indexPath) as! ImageTableCell
        
        cell.image = "https://ilinks.io/static/images/main.webp"
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
