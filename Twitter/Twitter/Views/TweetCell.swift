//
//  TweetCell.swift
//  Twitter
//
//  Created by Joe Suzuki on 12/27/17.
//  Copyright © 2017 Joe Suzuki. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else {return}
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.username)\n"
            attributedText.append(NSMutableAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle ,range: range)
            
            attributedText.append(NSMutableAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15)]))

            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Test"
        return tv
    }()
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "IMG_3557")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()

    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
