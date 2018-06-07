//
//  DetailsViewController.swift
//  CryptoCurrency Tracker
//


import UIKit
import Alamofire

extension Double {
    var stringValue: String {
        return "\(self)"
    }
}

class DetailsViewController: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet weak var lblCoinName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lbl24H: UILabel!
    @IBOutlet weak var lblCoinMarketCap: UILabel!
    @IBOutlet weak var lblAllTimeHigh: UILabel!
    @IBOutlet weak var lbl24HVolume: UILabel!
    
    
    @IBOutlet weak var chartView: Chart!
    
    //MARK: - Class Variables -
    
    var arrCoinDetails = [CoinDetailList]()
    
    var coin: CoinList! {
        didSet {
            loadDataFromAPI(withSymbol: coin.symbol)
        }
    }
    
    func setupChart() {
        var data = [(x: Double, y: Double)]()
        
        arrCoinDetails.enumerated().forEach { index, obj in
            data.append((x: Double(index), y: obj.high))
        }
        
        let series = ChartSeries(data: data)
        series.area = true
        
        // Use `xLabels` to add more labels, even if empty
        
        chartView.xLabels = [0, 10, 20, 30 ,40, 50, 60]
        
        // Format the labels with a unit
        chartView.xLabelsFormatter = { String(Int(round($1))) + "D" }
        
        chartView.add(series)
    }
    
    //MARK: - Action Methods -

    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .blackOpaque

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lblCoinName.text = coin.name
        lblPrice.text = coin.price
        lbl24H.text = coin.percentageChange24h.stringValue
        
        lblCoinMarketCap.text = coin.marketCap.stringValue
        lblAllTimeHigh.text = coin.maxSupply.stringValue
        lbl24HVolume.text = coin.volume24h.stringValue
    }
    
    func loadDataFromAPI(withSymbol symbol: String) {
        
        let detailsListUrl: URL = URL(string: "https://min-api.cryptocompare.com/data/histoday?fsym=\(symbol)&tsym=USD&limit=60&aggregate=3&e=CCCAGG")!
        
        Alamofire.request(detailsListUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let data = response.data {
                
                if let jsonResponse = try? JSON(data: data) {
                    
                    if let arrDatas = jsonResponse["Data"].array {
                        for obj in arrDatas {
                            self.arrCoinDetails.append(CoinDetailList(jsonData: obj, maxSupply: self.coin.maxSupply, volume24h: self.coin.volume24h, marketCap: self.coin.marketCap, percentageChange24h: self.coin.percentageChange24h))
                        }
                        
                        self.setupChart()
                    }
                }
            }
        }
    }
}
