//
//  HomeCell.swift
//  CryptoCurrency Tracker
//


import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    @IBOutlet weak var coinPercentage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Class Variables -
    
    var coinList: CoinList! {
        didSet {
            coinName.text = "\(coinList.name) (\(coinList.symbol))"
            coinPrice.text = "$\(coinList.price)"
            let percentageValue =  Double(round(1000*Double(coinList.percentage)!)/1000)
            
            coinPercentage.text = percentageValue.stringValue
            
            coinPercentage.textColor = percentageValue > 0 ? .green : .red
        }
    }

}
