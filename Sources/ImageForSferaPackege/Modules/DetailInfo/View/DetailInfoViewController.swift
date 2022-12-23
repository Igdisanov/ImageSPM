//
//  File.swift
//
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import UIKit
import Kingfisher

final class DetailInfoViewController: UIViewController {
    
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
    
    private let output: DetailInfoViewOutput
    
    // MARK: - Private Properties
    
    private var image: ImageDataInfo?
    private var isTapped = false
    private var frameUserImageView: CGRect!
    
    // MARK: - Initializers
    
    init(output: DetailInfoViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    func setupInitialState(image: ImageDataInfo) {
        self.image = image
    }
}
