//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import CoreData
import Kingfisher

@available(iOS 13.0, *)
public class LikeImageViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var output: LikeImageViewOutput!
    
    // MARK: - Private Properties
    
    private let imageTableView = UITableView()
    private var savedImages = [ImageInfo]()
    private var provider: EmployeeProvider?
    
    // MARK: - Initializers
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.getImages(with: self)
        self.imageTableView.reloadData()
    }
    
    // MARK: - Setup UI
    
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

@available(iOS 13.0, *)
extension LikeImageViewController: LikeImageViewInput {
    func setupInitialState(provider: EmployeeProvider?) {
        self.provider = provider
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
@available(iOS 13.0, *)
extension LikeImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        provider?.fetchedResultController.fetchedObjects?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.className, for: indexPath) as! ImageTableCell
        let image = provider?.fetchedResultController.object(at: indexPath)
        cell.setupUICell(image: image)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let image = provider?.fetchedResultController.object(at: indexPath) else {return}
        output.deleteImage(image: image)
        output.getImages(with: self)
        self.imageTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let image = provider?.fetchedResultController.object(at: indexPath) else {return}
        
        let imageData = ImageDataInfo(id: image.id ?? "",
                                      color: image.color ?? "#FFFFFF",
                                      urls: ["regular" : image.regular ?? ""],
                                      height: Int(image.height),
                                      width: Int(image.width),
                                      likes: Int(image.likes),
                                      user: UserIinfo(name: image.name ?? "", profileImage: ["large" : image.medium ?? ""]))
        
        output.openDetailInfo(vc: self, image: imageData)
    }
}

// MARK: - CoreData NSFetchedResultsControllerDelegate

@available(iOS 13.0, *)
extension LikeImageViewController: NSFetchedResultsControllerDelegate {
    
}
