//
//  ImageCell.swift
//  
//
//  Created by Vadim Igdisanov on 12.12.2022.
//

import UIKit
import Kingfisher
import Models

class ImageCell: UICollectionViewCell {
    
    // MARK: - Visual Components
    
    var image: ImageData! {
        didSet {
            let imageUrl = image.urls["regular"]
            guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {return}
            imageView.kf.setImage(with: url)
        }
    }
    
    // MARK: - Private Properties
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let checkMark: UIImageView = {
        var image = UIImage(named: "State", in: Bundle.module, compatibleWith: nil)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
    
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateSelectedState()
        setupImageView()
        setupCheckMark()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func setupCheckMark() {
        addSubview(checkMark)
        checkMark.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8).isActive = true
        checkMark.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8).isActive = true
        checkMark.heightAnchor.constraint(equalToConstant: 16).isActive = true
        checkMark.widthAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    private func updateSelectedState() {
        imageView.alpha = isSelected ? 0.6 : 1
        checkMark.alpha = isSelected ? 1 : 0
    }
    
    static var className: String {
        return String(describing: self)
    }
    
}
