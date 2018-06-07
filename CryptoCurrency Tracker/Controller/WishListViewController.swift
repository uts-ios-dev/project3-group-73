//
//  WishListViewController.swift
//  CryptoCurrency Tracker
//


import UIKit
import CoreData

class WishListViewController: UIViewController {

    @IBOutlet weak var wishListTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "WishList")
        
        
    }
}



extension WishListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistCell", for: indexPath) as! WishlistCell
                
        return cell
    }
}
