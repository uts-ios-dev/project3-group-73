//
//  AddWishListViewController.swift
//  CryptoCurrency Tracker
//


import UIKit
import CoreData

class AddWishListViewController: UIViewController {
    @IBOutlet weak var coinTextfield: UITextField!
    
    @IBOutlet weak var addWishlistButton: UIButton!
    @IBOutlet weak var priceTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addWishListAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Wishlist", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)

        newUser.setValue(coinTextfield.text, forKey: "Coin")
        newUser.setValue(priceTextfield.text, forKey: "Type")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
