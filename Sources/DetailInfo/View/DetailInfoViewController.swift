//
//  File.swift
//
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import DataKit
import Models
import Kingfisher

public class DetailInfoViewController: UIViewController {
    
    var output: DetailInfoViewOutput!
    
    private var image: ImageDataInfo?
    
    private var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "♥️ - 100"
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI(image: image)
    }
    
    private func setupUI(image: ImageDataInfo?) {
        guard
            let image = self.image,
            let imageUrl = image.urls?["regular"],
            let url = URL(string: imageUrl)
        else {return}
        
        contentImageView.kf.setImage(with: url)
        setupContentView(image: image)
        setupContentImageView(image: image)
        setupLikeLabel()
    }
    
    private func setupContentView(image: ImageDataInfo) {
        self.view.addSubview(contentView)
        
        contentView.backgroundColor = UIColor(hexString: image.color ?? "#FFFFFF")
        contentView.layer.cornerRadius = 15
        
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        let widht = self.view.frame.width - 220
        contentView.widthAnchor.constraint(equalToConstant: widht).isActive = true
        
        let height = CGFloat(image.height ?? 100) * widht / CGFloat(image.width ?? 100)
        contentView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
    }
    
    private func setupContentImageView(image: ImageDataInfo) {
        self.contentView.addSubview(contentImageView)
        contentImageView.layer.cornerRadius = 8
        contentImageView.clipsToBounds = true
        contentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
    
    private func setupLikeLabel() {
        self.view.addSubview(likeLabel)
        likeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        likeLabel.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 24).isActive = true
    }
    
}

//MARK: DetailInfoViewInput

extension DetailInfoViewController: DetailInfoViewInput {
    func setupInitialState(image: Models.ImageDataInfo) {
        self.image = image
    }
}

extension UIColor {
    var redComponent: CGFloat { return cgColor.components?[0] ?? 0 }
    var greenComponent: CGFloat { return cgColor.components?[1] ?? 0 }
    var blueComponent: CGFloat { return cgColor.components?[2] ?? 0 }
    var alpha: CGFloat {
        guard let components = cgColor.components else {
            return 1
        }
        return components[cgColor.numberOfComponents-1]
    }
}


extension UIColor {
    convenience init(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? String(hexString.dropFirst()) : hexString)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1
        
        // swiftlint:disable fallthrough
        switch chars.count {
        case 3:
            chars = [chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]]
            fallthrough
        case 6:
            chars = ["F", "F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            alpha = 0
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var hexString: String {
        return NSString(format: "%02X%02X%02X%02X", Int(round(redComponent * 255)), Int(round(greenComponent * 255)), Int(round(blueComponent * 255)), Int(round(alpha * 255))) as String
    }
}
