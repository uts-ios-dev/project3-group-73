//
//  PortfolioCell.swift
//  CryptoCurrency Tracker
//

import UIKit

class PortfolioCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UIView!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalProfitLabel: UILabel!
    @IBOutlet weak var profitPercentageLabel: UILabel!
    
    @IBOutlet weak var viewPercentage: UIView!
    @IBOutlet weak var viewTotalProfit: UIView!
    @IBOutlet weak var viewTotalCost: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewTotalCost.layer.cornerRadius = 4.0
        viewTotalProfit.layer.cornerRadius = 4.0
        viewTotalCost.layer.cornerRadius = 4.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
