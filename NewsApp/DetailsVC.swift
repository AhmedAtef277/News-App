//
//  DetailsVC.swift
//  NewsApp
//
//  Created by mac on 18/07/2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UITextView!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    var data : News?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        newsTitle.text = data?.title
        newsAuthor.text = (data?.author ?? "")
        newsDescription.text = data?.description
        guard let imageUrl = data?.urlToImage else{return}
        let url = URL(string: imageUrl)
        newsImage.kf.setImage(with: url)
        backButton.layer.borderColor = backButton.titleLabel?.textColor.cgColor
        backButton.layer.borderWidth = 1
        
    }
    

    @IBAction func backToNews(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}





