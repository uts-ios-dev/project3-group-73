//
//  PortfolioViewController.swift
//  CryptoCurrency Tracker
//


import UIKit

class PortfolioViewController: UIViewController {

    @IBOutlet weak var portfolioTableView: UITableView!
    @IBOutlet weak var addTransactionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barStyle = .blackOpaque
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTransactionAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTransactionVC = storyboard.instantiateViewController(withIdentifier: "addPortfolioVC") as! AddTransactionViewController
        present(addTransactionVC, animated: true, completion: nil)
    }
}

extension PortfolioViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioCell", for: indexPath) as! PortfolioCell
        
        return cell
    }
    
}
