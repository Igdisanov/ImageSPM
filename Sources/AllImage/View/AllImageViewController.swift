//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import NetworkService
import Models

public class AllImageViewController: UIViewController {
    
    private var imageCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var output: AllImageViewOutput!
    var networkDataFetcher = NetworkDataFetcher()
    private var timer: Timer?
    private var images = [ImageData]()
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private lazy var addBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add,
                               target: self,
                               action: #selector(addBarButtonTapped))
    }()
    
    private lazy var actionBarButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "info", style: .done,
                               target: .none,
                               action: #selector(actionBarButtonTapped))
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSearchBar()
        setupNavigationBar()
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self

    }
    
    
    @objc private func addBarButtonTapped(){    }
    
    @objc private func actionBarButtonTapped(){
        
    }
    
    private func setupCollectionView() {
        
        self.view.addSubview(imageCollectionView)
        imageCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageCollectionView.layoutMargins = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        imageCollectionView.contentInsetAdjustmentBehavior = .automatic
        imageCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.className)
        
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "All PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButton, addBarButton]
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

     //MARK: AllImageViewInput

extension AllImageViewController: AllImageViewInput {
    
    func setupInitialState() {
        
    }
}

     //MARK: - setupCollectionView

extension AllImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.className, for: indexPath) as! ImageCell
        cell.image = images[indexPath.item]
        return cell
    }
}

     //MARK: - UISearchBarDelegate

extension AllImageViewController: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.fetchImages(searchTerm: searchText) { [weak self] (searchResults) in
                guard let fetchedImage = searchResults else {return}
                self?.images = fetchedImage.results
                self?.imageCollectionView.reloadData()
            }
        })
        
    
    }
    
}

     //MARK: - UICollectionViewDelegateFlowLayout
 
extension AllImageViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = images[indexPath.item]
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widhtPerItem = availableWidth / itemsPerRow
        let height = CGFloat(image.height) * widhtPerItem / CGFloat(image.width)
        return CGSize(width: widhtPerItem, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
