//
//  HomeViewController.swift
//  CryptoCurrency Tracker
//


import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var currencyTableView: UITableView!
    @IBOutlet weak var homeTabBar: UITabBar!
    
    let coinListUrl: URL = URL(string: "https://api.coinmarketcap.com/v2/ticker/")!
    
    var arrCoinList = [CoinList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTableView.tableFooterView = UIView()
        currencyTableView.estimatedRowHeight = 44
        currencyTableView.rowHeight = UITableViewAutomaticDimension
        
        currencyTableView.estimatedSectionHeaderHeight = 44
        currencyTableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        self.navigationController?.navigationBar.isHidden = true
       
        self.loadDataFromAPI()
        
        self.navigationController?.navigationBar.barStyle = .blackOpaque
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loadDataFromAPI() {
        
        Alamofire.request(coinListUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let data = response.data {
                
                if let jsonResponse = try? JSON(data: data) {
                    
                    if let dicCoinList = jsonResponse["data"].dictionary {
                        
                        dicCoinList.forEach { obj in
                            self.arrCoinList.append(CoinList(jsonData: obj.value))
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.currencyTableView.reloadData()
                    }
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeCell
        cell.coinName.text = "Coin Name (Code)"
        cell.coinPrice.text = "Price"
        cell.coinPercentage.text = "24h"
        
        cell.coinName.font = UIFont.boldSystemFont(ofSize: 16)
        cell.coinPrice.font = UIFont.boldSystemFont(ofSize: 16)
        cell.coinPercentage.font = UIFont.boldSystemFont(ofSize: 16)
        
        let bottomView = UIView()
        bottomView.backgroundColor = .groupTableViewBackground
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        cell.insertSubview(bottomView, at: 0)
        
        let tempView = UIView()
        tempView.backgroundColor = .white
        tempView.translatesAutoresizingMaskIntoConstraints = false
        cell.insertSubview(tempView, at: 0)
        
        NSLayoutConstraint.activate([
            tempView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            tempView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            tempView.topAnchor.constraint(equalTo: cell.topAnchor),
            tempView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            
            bottomView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCoinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeCell
        
        cell.coinList = arrCoinList[indexPath.row]
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsViewController
        detailsVC.coin = arrCoinList[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
