//
//  ProfileHeader.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 01/02/23.
//

import UIKit

class ProfileTableViewHeader: UIView {

    private let profileHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ucl")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
