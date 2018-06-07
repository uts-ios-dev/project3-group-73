//
//  AddTransactionViewController.swift
//  CryptoCurrency Tracker
//


import UIKit
import CoreData

class AddTransactionViewController: UIViewController {

    @IBOutlet weak var coinTextField: UITextField!
    @IBOutlet weak var typeTextfield: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    @IBOutlet weak var priceTextfield: UITextField!
    @IBOutlet weak var quantityTextfield: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addPickerView: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var arrType = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = 4.0
        typeTextfield.addSubview(addPickerView)
        dateTextfield.addSubview(datePicker)
        
        arrType = ["Buy","Sell"]
        self.navigationController?.navigationBar.barStyle = .blackOpaque

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func addTransactionButtonAction(_ sender: Any) {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Portfolio", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//
//        newUser.setValue(coinTextField.text, forKey: "Coin")
//        newUser.setValue(typeTextfield.text, forKey: "Type")
//
//        newUser.setValue(dateTextfield.text, forKey: "Date")
//        newUser.setValue(priceTextfield.text, forKey: "Price")
//
//        do {
//            try context.save()
//        } catch {
//            print("Failed saving")
//        }
        
        dismiss(animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let newsVC = storyboard.instantiateViewController(withIdentifier: "newsVC") as! NewsViewController
//        self.navigationController?.pushViewController(newsVC, animated: true)
//        
    }
    
}

extension AddTransactionViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return arrType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return "Select Type"
    }
    
}

extension AddTransactionViewController {
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateTextfield.inputAccessoryView = toolbar
        dateTextfield.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextfield.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}




