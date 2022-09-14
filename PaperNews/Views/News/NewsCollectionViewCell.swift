//
//  NewsCollectionViewCell.swift
//  PaperNews
//
//  Created by pc on 8.09.2022.
//

import UIKit
import Kingfisher

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsPublicationDateLabel: UILabel!
    
    private var article: Article?
    
    func configure(article: Article) {
        self.article = article
        newsImageView.kf.setImage(with: article.imageURL)
        newsTitleLabel.text = article.title
        newsDescriptionLabel.text = article.description
        newsPublicationDateLabel.text = article.publicationDate
    }
}
