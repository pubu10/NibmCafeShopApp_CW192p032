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
        
        var max : String = ""
        
        let Categorys = db?.collection("Categorys")
               Categorys!
                .order(by: "CategoryID", descending: true).limit(to: 1).addSnapshotListener { [self] (snapshot, err) in
                    if err != nil {
                        print(err?.localizedDescription ?? "")
                    }else{
                        if snapshot?.isEmpty != true {
                            for document in snapshot!.documents{
                               
                                let x : Int = document.get("CategoryID") as! Int
                                max = String(x)
                                
                                let next = (max as NSString).integerValue
                                self.db?.collection("Categorys").document(String((next+1))).setData(self.GetDictionaryRepresentation(CategoryID : ((next+1)),Name: CategoryName.text!)) { err in
                                    if ( err == nil )
                                    {
                                        print(next+1);
                                        return
                                    }
                                }
                                
                                
                                
                            }
                        }
                        
                    }
                  
                }
        
  
        
        
        
       
            
    }
    
   
       
      
    
    
    
//CategoryID :Int,Name : String) -> [String: Any] //CategoryID: 1,Name: "test") // CategoryID :Int
    
    
    func GetDictionaryRepresentation(CategoryID : Int,Name : String )-> [ String : Any ]  {
        return [
            "CategoryID" : CategoryID,
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
