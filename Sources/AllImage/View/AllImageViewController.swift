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
    
    // MARK: - Visual Components
    
    private var imageCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var addBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add,
                               target: self,
                               action: #selector(addBarButtonTapped))
    }()
    
    private lazy var infoBarButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "info", style: .done,
                               target: .none,
                               action: #selector(infoBarButtonTapped))
    }()
    
    private lazy var actionBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action,
                               target: self,
                               action: #selector(actionBarButtonTapped))
    }()
    
    // MARK: - Public Properties
    
    var output: AllImageViewOutput!
    var networkDataFetcher = NetworkDataFetcher()
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var images = [ImageData]()
    private var selectedImeges = [UIImage]()
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    private var numberOfSelectedPhotos: Int {
        return imageCollectionView.indexPathsForSelectedItems?.count ?? 0
    }
    
    // MARK: - Initializers
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        updateNavButtonsState()
        setupCollectionView()
        setupSearchBar()
        setupNavigationBar()
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.output.requestImage(searchTerm: nil)
    }
    
    // MARK: - Private Methods
    
    
    private func refresh() {
        self.selectedImeges.removeAll()
        self.imageCollectionView.selectItem(at: nil, animated: true, scrollPosition: [])
        updateNavButtonsState()
    }
    
    private func updateNavButtonsState() {
        addBarButton.isEnabled = numberOfSelectedPhotos > 0
        actionBarButton.isEnabled = numberOfSelectedPhotos > 0
        infoBarButton.isEnabled =  numberOfSelectedPhotos == 1
    }
    
    // MARK: - Action Methods
    
    @objc private func addBarButtonTapped(){
        
    }
    
    @objc private func infoBarButtonTapped(){
        
    }
    
    @objc private func actionBarButtonTapped(sender: UIBarButtonItem){
        let shareController = UIActivityViewController(activityItems: selectedImeges,
                                                       applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                self.refresh()
            }
        }
        
        shareController.popoverPresentationController?.barButtonItem = sender
        shareController.popoverPresentationController?.permittedArrowDirections = .any
        present(shareController, animated: true)
    }
    
    // MARK: - Setup UI
    
    private func setupCollectionView() {
        self.view.addSubview(imageCollectionView)
        imageCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageCollectionView.layoutMargins = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        imageCollectionView.contentInsetAdjustmentBehavior = .automatic
        imageCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.className)
        imageCollectionView.allowsMultipleSelection = true
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "All PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButton, addBarButton, infoBarButton]
        
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

//MARK: - AllImageViewInput

extension AllImageViewController: AllImageViewInput {
    func setupInitialState(images: [Models.ImageData]) {
        self.images = images
        self.imageCollectionView.reloadData()
        self.refresh()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension AllImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.className, for: indexPath) as! ImageCell
        cell.image = images[indexPath.item]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateNavButtonsState()
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
        guard let image = cell.imageView.image else {return}
        selectedImeges.append(image)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateNavButtonsState()
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
        guard let image = cell.imageView.image else {return}
        if let index = selectedImeges.firstIndex(of: image) {
            selectedImeges.remove(at: index)
        }
    }
}



//MARK: - UICollectionViewDelegateFlowLayout

extension AllImageViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = images[indexPath.item]
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widhtPerItem = availableWidth / itemsPerRow
        let height = CGFloat(image.height) * widhtPerItem / CGFloat(image.width)
        return CGSize(width: widhtPerItem, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

//MARK: - UISearchBarDelegate

extension AllImageViewController: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            if searchText.isEmpty {
                self.output.requestImage(searchTerm: nil)
            } else {
                self.output.requestImage(searchTerm: searchText)
            }
            
        })
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.output.requestImage(searchTerm: nil)
    }
}
