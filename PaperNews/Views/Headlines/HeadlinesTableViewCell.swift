//
//  HeadlinesTableViewCell.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import UIKit

class HeadlinesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headlineImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(topic: String) {
        headlineLabel.text = topic
        let imageName = topic.lowercased()
        let finalImage = imageName.withoutPunctuations
        let image = UIImage(named: finalImage)
        headlineImageView.image = image
        headlineImageView.alpha = 0.6
    }
}
