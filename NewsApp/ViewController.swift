//
//  ViewController.swift
//  NewsApp
//
//  Created by mac on 12/07/2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    
    @IBOutlet weak var newsTableView: UITableView!
    var newsArray = [News]()
    var newsImageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
            }
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NetworkManager.shared.getNews { [weak self] news in
            
            if let news = news {
               // guard let self = self else {return}
                self?.newsArray = news
                
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                }
            }
        }
        
    }
}
    
    
        
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsCell{
            cell.configurCell(data: newsArray[indexPath.row])
         
            return cell
        }
        return UITableViewCell()
    }
    
    

}
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Open in", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Safari", style: .default, handler: {[weak self] _ in
            let news = self?.newsArray[indexPath.row]
            guard let url = URL(string: news?.url ?? "") else {return}
                    let configuration = SFSafariViewController.Configuration()
                    let safari = SFSafariViewController(url: url, configuration: configuration)
                    safari.modalPresentationStyle = .fullScreen
            self?.present(safari, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "News App ", style: .default, handler: {[weak self] _ in
            if let detailsVC = self?.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC {
                detailsVC.data = self?.newsArray[indexPath.row]
                self?.present(detailsVC, animated: true)
            }

        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
                present(alert, animated: true, completion: nil)
        
    }
    
}
