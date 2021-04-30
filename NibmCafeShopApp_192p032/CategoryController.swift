//
//  CategoryController.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//

import UIKit
import Firebase

class CategoryController: UIViewController {

    @IBOutlet weak var CategoryName: UITextField!
    public var db: Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.db = Firestore .firestore()
    }
    
    @IBAction func btnAddCategoryClick(_ sender: UIButton) {
        
       
        self.db?.collection("Categorys").document("1").setData(self.GetDictionaryRepresentation(CategoryID : (1),Name: CategoryName.text!)) { err in
            
            let alert = UIAlertController(title: "Alert", message: "Successfully Added", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func GetDictionaryRepresentation(CategoryID : Int,Name : String )-> [ String : Any ]  {
        return [
            "CategoryID" : 1,
            "Name" : Name
            
        ]
    }
    
    public class Categorys
    {
        public var CategoryID: String = ""
        public var Name: String = ""
        
        init() {
            self.CategoryID = ""
            self.Name = ""
        }
        
        init(CategoryID: String , Name: String ) {
            self.CategoryID = CategoryID
            self.Name = Name
        }
        
        
      
    }
   

}
