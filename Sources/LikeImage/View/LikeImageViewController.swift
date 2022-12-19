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

@available(iOS 13.0, *)
public class LikeImageViewController: UIViewController {
    
    private lazy var provider: EmployeeProvider = {
        let dataProvider = EmployeeProvider(with: self)
        return dataProvider
    }()
    
    var output: LikeImageViewOutput!
    let imageTableView = UITableView()
    private var savedImages = [ImageInfo]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

@available(iOS 13.0, *)
extension LikeImageViewController: LikeImageViewInput {
    func setupInitialState() {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
@available(iOS 13.0, *)
extension LikeImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        provider.fetchedResultController.fetchedObjects?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.className, for: indexPath) as! ImageTableCell
        let image = provider.fetchedResultController.object(at: indexPath)
        cell.setupUICell(image: image)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let image = provider.fetchedResultController.object(at: indexPath)
        output.deleteImage(image: image)
        }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - CoreData NSFetchedResultsControllerDelegate

@available(iOS 13.0, *)
extension LikeImageViewController: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.imageTableView.endUpdates()
    }
    
    public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.imageTableView.beginUpdates()
        }
}
