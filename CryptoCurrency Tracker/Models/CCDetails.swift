//
//  CCDetails.swift
//  CryptoCurrency Tracker
//


import Foundation

struct CoinDetailList {

    let low                 : Double
    let close               : Double
    let volumefrom          : Double
    let open                : Double
    let volumeto            : Double
    let time                : Double
    let high                : Double
    
    var maxSupply           : Double = 0
    var volume24h           : Double = 0
    var marketCap           : Double = 0
    var percentageChange24h : Double = 0

    init(jsonData: JSON, maxSupply: Double, volume24h: Double, marketCap: Double, percentageChange24h: Double) {
        low                 = jsonData["low"].doubleValue
        close               = jsonData["close"].doubleValue
        volumefrom          = jsonData["volumefrom"].doubleValue
        open                = jsonData["open"].doubleValue
        volumeto            = jsonData["volumeto"].doubleValue
        time                = jsonData["time"].doubleValue
        high                = jsonData["high"].doubleValue
        
        self.maxSupply              = maxSupply
        self.volume24h              = volume24h
        self.marketCap              = marketCap
        self.percentageChange24h    = percentageChange24h
    }
}
