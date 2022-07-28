//
//  NetworkManager.swift
//  NewsApp
//
//  Created by mac on 12/07/2022.
//

import Foundation
import Alamofire
import UIKit
import Kingfisher
class NetworkManager{
   // let imageCache = NSCache<NSString , NSData>()
    static let shared = NetworkManager()
    private init(){}
    private let baseUrl = "https://newsapi.org/v2/"
    private let USTopHeadLine = "top-headlines?country=us"
    
    func getNews(completion : @escaping ([News]?)->Void){
        let urlString = "\(baseUrl)\(USTopHeadLine)&apiKey=\(ApiKey.key)"
        guard let url = URL(string: urlString) else {return}
        AF.request(url).response { response in
           guard let data = response.data else{
               print("problem is here")
               return }
            
            switch response.result {
            case .success:
                do {
                    let newsEnvelope = try JSONDecoder().decode(NewsEnvelope.self, from: data)
                    completion(newsEnvelope.articles)
                } catch let error {
                    print(error)
                }
            case .failure:
                completion(nil)
            }
        }
        
    }
//    func getImage(urlStirng : String , completion : @escaping (Data?)->Void){
//        guard let url = URL(string: urlStirng) else{
//            completion(nil)
//            return
//        }
//        if let cachedImage = imageCache.object(forKey: NSString(string: urlStirng)){
//            completion(cachedImage as? Data)
//        }else{
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                guard error == nil , let data = data else {
//                    completion(nil)
//                    return
//                }
//                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlStirng))
//                completion(data)
//
//            }.resume()
//        }
//
//
//    }
}
