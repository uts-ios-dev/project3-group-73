//
//  WishlistCell.swift
//  CryptoCurrency Tracker
//


import UIKit

class WishlistCell: UITableViewCell {

    @IBOutlet weak var coinLabel: UIStackView!
    @IBOutlet weak var priceLabel: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
