//
//  ImageTableCell.swift
//  
//
//  Created by Vadim Igdisanov on 14.12.2022.
//

import UIKit
import Kingfisher
import Models

class ImageTableCell: UITableViewCell {
    
    // MARK: - Visual Components
    
//    var image: ImageData! {
//        didSet {
//            let imageUrl = image.urls["small"]
//            guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {return}
//            castomImageView.kf.setImage(with: url)
//        }
//    }
    
    var image: String! {
        didSet {
            let imageUrl = image
            guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {return}
            castomImageView.kf.setImage(with: url)
        }
    }
    
    let castomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        castomImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupImageView()
        // Configure the view for the selected state
    }
    
    private func setupImageView() {
        addSubview(castomImageView)
        castomImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        castomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        castomImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        castomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
    }
    
    static var className: String {
        return String(describing: self)
    }
}
