//
//  TweetTableViewCell.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 31/01/23.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    
    private let avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .darkGray
        return imageView
    }()
    
    
    private let displayName: UILabel = {
       let label = UILabel()
        label.text = "Rivaldo Fernandes"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(avatarImageView)
        
        configureConstraint()
    }
    
    private func configureConstraint(){
        let avatarImageViewConstraint = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraint)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
