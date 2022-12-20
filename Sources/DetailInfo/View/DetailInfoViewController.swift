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
    
    // MARK: - Visual Components
    
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
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    // MARK: - Public Properties
    
    var output: DetailInfoViewOutput!
    
    // MARK: - Private Properties
    
    private var image: ImageDataInfo?
    private var isTapped = false
    private var frameUserImageView: CGRect!
    
    // MARK: - Initializers
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI(image: image)
    }
    
    // MARK: - Setup UI
    
    private func setupUI(image: ImageDataInfo?) {
        
        setupContentView()
        setupContentImageView()
        setupLikeLabel()
        setupUserImageView()
    }
    
    private func setupContentView() {
        guard let image = self.image else {return}
        
        self.view.addSubview(contentView)
        
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor(hexString: image.color ?? "#FFFFFF")
        
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        let widht = self.view.frame.width - 64
        contentView.widthAnchor.constraint(equalToConstant: widht).isActive = true
        
        let height = CGFloat(image.height ?? 100) * widht / CGFloat(image.width ?? 100)
        contentView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
    }
    
    private func setupContentImageView() {
        guard let image = self.image else {return}
        
        kingFisherImage(imageView: contentImageView, image: image, imageUrl: image.urls?["regular"])
        
        self.view.addSubview(contentImageView)
        
        contentImageView.layer.cornerRadius = 8
        contentImageView.clipsToBounds = true
        
        contentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedContentImage))
        contentImageView.addGestureRecognizer(tap)
        contentImageView.isUserInteractionEnabled = true
    }
    
    private func setupUserImageView() {
        guard let image = self.image else {return}
        
        kingFisherImage(imageView: userImageView, image: image, imageUrl: image.user?.profile_image?["large"])
        
        self.view.addSubview(userImageView)
        
        userImageView.layer.cornerRadius = 8
        userImageView.clipsToBounds = true
        
        userImageView.bottomAnchor.constraint(equalTo: self.contentView.topAnchor, constant: -16).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        
        let widht = self.view.frame.width / 7
        userImageView.widthAnchor.constraint(equalToConstant: widht).isActive = true
        
        let height = CGFloat(image.height ?? 100) * widht / CGFloat(image.width ?? 100)
        userImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedUserImage))
        userImageView.addGestureRecognizer(tap)
        userImageView.isUserInteractionEnabled = true
    }
    
    private func setupLikeLabel() {
        guard let image = self.image else {return}
        
        self.view.addSubview(likeLabel)
        
        likeLabel.text = "♥️ \(image.likes ?? 0)"
        likeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        likeLabel.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 24).isActive = true
    }
    
    // MARK: - Private Methods
    
    private func kingFisherImage(imageView: UIImageView,image: ImageDataInfo, imageUrl: String? ) {
        guard
            let imageUrl = imageUrl,
            let url = URL(string: imageUrl)
        else {return}
        imageView.kf.setImage(with: url)
    }
    
    // MARK: - Action Methods
    
    @objc func tappedUserImage(){
        UIView.animate(withDuration: 0.5, animations: {
            if !self.isTapped {
                self.isTapped = true
                self.frameUserImageView = CGRect()
                self.frameUserImageView = self.userImageView.frame
                let scaleX = self.userImageView.frame.width / self.contentImageView.frame.width * 30
                let scaleY = self.userImageView.frame.height / self.contentImageView.frame.height * 30
                self.userImageView.center = self.view.center
                self.userImageView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
                self.contentImageView.alpha = 0.0
                self.userImageView.alpha = 0.0
            }
        }) { _ in
            guard let image = self.image else {return}
            self.kingFisherImage(imageView: self.contentImageView, image: image, imageUrl: image.user?.profile_image?["large"])
            self.contentImageView.alpha = 1.0
            self.likeLabel.text = image.user?.name
        }
    }
    
    @objc func tappedContentImage(){
        UIView.animate(withDuration: 0.5, animations: {
            if self.isTapped {
                guard let image = self.image else {return}
                self.kingFisherImage(imageView: self.contentImageView, image: image, imageUrl: image.urls?["regular"])
                self.contentImageView.alpha = 1.0
                self.likeLabel.text = "♥️ \(image.likes ?? 0)"
                self.isTapped = false
                self.userImageView.frame = self.frameUserImageView
                self.userImageView.transform = .identity
                self.contentImageView.transform = .identity
                self.contentImageView.alpha = 1.0
                self.userImageView.alpha = 1.0
            }
        })
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
