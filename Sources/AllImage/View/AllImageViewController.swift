//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import NetworkService
import Models

public class AllImageViewController: UICollectionViewController {
    
    var output: AllImageViewOutput!
    var networkDataFetcher = NetworkDataFetcher()
    private var timer: Timer?
    
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
    }
    
    @objc private func addBarButtonTapped(){
        
    }
    
    @objc private func actionBarButtonTapped(){
        
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
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
        navigationItem.hidesSearchBarWhenScrolling = false
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

extension AllImageViewController {
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

     //MARK: - UISearchBarDelegate

extension AllImageViewController: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] (_) in
            self?.networkDataFetcher.fetchImages(searchTerm: searchText) { (searchResults) in
                searchResults?.results.map { (user) in
                    print(user.likes)
                }
            }
        })
        
    
    }
    
}
