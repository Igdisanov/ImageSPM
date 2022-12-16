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
    
    var castomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
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
        castomImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    static var className: String {
        return String(describing: self)
    }
}
