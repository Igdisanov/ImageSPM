//
//  ImageTableCell.swift
//  
//
//  Created by Vadim Igdisanov on 14.12.2022.
//

import UIKit
import Kingfisher
import Models
import DataKit

class ImageTableCell: UITableViewCell {
    
    // MARK: - Visual Components
    
    private var likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var castomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        castomImageView.image = nil
        likeLabel.text = nil
    }
    
    func setupUICell(image: ImageInfo) {
        guard let imageUrl = image.regular, let url = URL(string: imageUrl) else {return}
        castomImageView.kf.setImage(with: url)
        likeLabel.text = "\(image.likes) ♥️"
        setupImageView()
        setupLikeLabel()
    }
    
    private func setupImageView() {
        
        addSubview(castomImageView)
        castomImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        castomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        castomImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        castomImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupLikeLabel() {
        addSubview(likeLabel)
        likeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        likeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    static var className: String {
        return String(describing: self)
    }
}
