//
//  NewsViewController.swift
//  CryptoCurrency Tracker
//

import UIKit
import Alamofire

class NewsViewController: UIViewController {

    @IBOutlet weak var newstableView: UITableView!
    
    let newsListUrl: URL = URL(string: "https://min-api.cryptocompare.com/data/v2/news/?lang=EN")!
    
    var arrNewsList = [NewsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newstableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.barStyle = .blackOpaque

        self.loadDataFromAPI()
    }
    
    func loadDataFromAPI() {
        
        Alamofire.request(newsListUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let data = response.data {
                
                if let jsonResponse = try? JSON(data: data) {
                    
                    if let arrNewsList = jsonResponse["Data"].array {
                        for news in arrNewsList {
                            self.arrNewsList.append(NewsList(jsonData:news))
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.newstableView.reloadData()
                    }
                }
            }
        }
    }
}

extension NewsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.newsList = arrNewsList[indexPath.row]
        
        return cell
    }
}
