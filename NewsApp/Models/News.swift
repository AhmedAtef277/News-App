//
//  News.swift
//  NewsApp
//
//  Created by mac on 12/07/2022.
//

import Foundation
struct News : Codable {
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?

    }
struct NewsEnvelope : Codable{
    let status : String
    let totalResults : Int
    let articles :[News]
    
}



