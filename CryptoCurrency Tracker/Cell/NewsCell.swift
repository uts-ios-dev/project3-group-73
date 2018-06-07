//
//  NewsCell.swift
//  CryptoCurrency Tracker
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var newsImage: UIImageView!
    
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var newsList: NewsList! {
        didSet {
            
            titleLabel.text = newsList.title
            sourceLabel.text = newsList.category
            bodyLabel.text = newsList.body
            //newsImage.setImageWith(urlString: newsList.imageUrl)
            defaults.set(newsList.url, forKey: "URL")
        }
    }
    
    @IBAction func readMoreAction(_ sender: Any) {
        
        if let url = URL(string: defaults.object(forKey: "URL") as! String) {
            UIApplication.shared.open(url, options: [:])
        }
        
    }

}
