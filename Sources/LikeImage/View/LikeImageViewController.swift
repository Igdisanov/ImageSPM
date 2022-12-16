//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import Models
import CoreData
import DataKit
import Kingfisher

public class LikeImageViewController: UIViewController {
    
    var output: LikeImageViewOutput!
    let imageTableView = UITableView()
    private var savedImages = [ImageInfo]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.output.viewWillAppear()
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
    func setSavedImages(images: [DataKit.ImageInfo]) {
        self.savedImages = images
        imageTableView.reloadData()
    }
    
    
    func setupInitialState() {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension LikeImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        savedImages.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.className, for: indexPath) as! ImageTableCell
        let image = savedImages[indexPath.row]
        guard let imageUrl = image.regular, let url = URL(string: imageUrl) else {return cell}
        cell.castomImageView.kf.setImage(with: url)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}
