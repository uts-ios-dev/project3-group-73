//
//  CCNews.swift
//  CryptoCurrency Tracker
//


import Foundation

struct NewsList {
    
    let id              : String
    let title           : String
    let imageUrl        : String
    let url             : String
    let body            : String
    let category        : String
    
    init(jsonData: JSON) {
        id                  = jsonData["id"].stringValue
        title                = jsonData["title"].stringValue
        imageUrl              = jsonData["imageurl"].stringValue
        url                  = jsonData["url"].stringValue
        body                 = jsonData["body"].stringValue
        category              = jsonData["categories"].stringValue
    }
}
