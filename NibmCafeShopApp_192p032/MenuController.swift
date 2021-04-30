//
//  MenuController.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//

import UIKit
import iOSDropDown
import Firebase


class MenuController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtDiscount: UITextField!
    
    public var db: Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtName.placeholder = "Item Name"
        txtPrice.placeholder = "Price"
        txtCategory.placeholder = "Category"
        txtDescription.placeholder = "Discription"
        txtDiscount.placeholder = "Discount"
        
        self.db = Firestore .firestore()
    }
    
   
    
    func GetDictionaryRepresentation(ItemName : String,Price : String, Category : String, Description : String, Discount : String)-> [ String : Any ]  {
        return [
            "ItemName" : ItemName,
            "Price" : Price,
            "Category" : Category,
            "Description" : Description,
            "Discount" : Discount
            
        ]
    }
    
    
    @IBAction func btnAddClick(_ sender: Any) {
       
      
        self.db?.collection("Menus").document(txtName.text!).setData(self.GetDictionaryRepresentation(
                                                                        ItemName: txtName.text!, Price: txtPrice.text! , Category: txtCategory.text!, Description: txtDescription.text!, Discount: txtDiscount.text! )) { err in
                if ( err == nil )
                {
                   
                }
            
            let alert = UIAlertController(title: "Alert", message: "Successfully Added", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
            }
            
               
            
        }
         
        
    }

  
