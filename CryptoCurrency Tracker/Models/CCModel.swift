//
//  CCModel.swift
//  CryptoCurrency Tracker
//


import Foundation

struct CoinList {
    
    let id              : String
    let name            : String
    let symbol          : String
    let price           : String
    let percentage      : String
    
    let maxSupply           : Double
    let volume24h           : Double
    let marketCap           : Double
    let percentageChange24h : Double
    

    init(jsonData: JSON) {
        id              = jsonData["id"].stringValue
        name            = jsonData["name"].stringValue
        symbol          = jsonData["symbol"].stringValue
        price           = jsonData["quotes"]["USD"]["price"].stringValue
        percentage      = jsonData["quotes"]["USD"]["percent_change_1h"].stringValue
        
        maxSupply               = jsonData["max_supply"].doubleValue
        volume24h               = jsonData["quotes"]["USD"]["volume_24h"].doubleValue
        marketCap               = jsonData["quotes"]["USD"]["market_cap"].doubleValue
        percentageChange24h     = jsonData["quotes"]["USD"]["percent_change_24h"].doubleValue
    }
}
