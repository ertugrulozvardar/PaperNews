//
//  NewsCollectionReusableView.swift
//  PaperNews
//
//  Created by pc on 8.09.2022.
//

import UIKit

class NewsCollectionReusableView: UICollectionReusableView {
        
    
    static let identifier = "NewsCollectionReusableView"
    
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray4
        label.font = UIFont(name: "Snell Roundhand Bold", size: 35)
        label.textAlignment = .center
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemIndigo
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
