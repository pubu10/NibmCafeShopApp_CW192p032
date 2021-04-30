//
//  ResetPassword.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//
import Firebase
import UIKit

class ResetPassword: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBOutlet weak var txtResetEmail: UITextField!
    
   
    @IBAction func btnResetSendClick(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: txtResetEmail.text!) { error in
          
                let alert = UIAlertController(title: "Info", message: "Email Sent !", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
