//
//  SearchCollectionViewCell.swift
//  PaperNews
//
//  Created by pc on 9.09.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var searchedNewsTitleLabel: UILabel!
    @IBOutlet weak var searchedNewsImageView: UIImageView!
    @IBOutlet weak var searchedNewsDescriptionLabel: UILabel!
    
    var article: Article?
    
    func configure(article: Article) {
        self.article = article
        searchedNewsImageView.kf.setImage(with: article.imageURL)
        searchedNewsTitleLabel.text = article.title
        searchedNewsDescriptionLabel.text = article.description
        searchedNewsDescriptionLabel.text = article.publicationDate
    }
}
