//
//  NewsCell.swift
//  NewsApp
//
//  Created by mac on 13/07/2022.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

  //  @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsDescription: UILabel!
    // @IBOutlet weak var newsDescription: UILabel!
    
    func configurCell(data:News) {
        newsDescription.text = data.title
        guard let imageUrl = data.urlToImage else{return}
        let url = URL(string: imageUrl)
        newsImageView.kf.indicatorType = .activity
        newsImageView.kf.setImage(with: url)
   }
    
}
