//
//  CreateAccountViewController.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtMobile: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBackClick(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnCreateAccount(_ sender: Any) {
        
        let _validation = ValidationClass()
       // var msg : String
        
        guard let email = txtEmail.text, let mobile = txtMobile.text,  let password = txtPassword.text
                        else { return }
              
              let isValidateEmail = _validation.validateEmailId(emailID: email)
              if (isValidateEmail == false) {
                 print("Incorrect Email")
                // return
              }
              let isValidatePass = _validation.validatePassword(password: password)
              if (isValidatePass == false) {
                 print("Incorrect Pass")
                // return
              }
              let isValidateMobile = _validation.validaPhoneNumber(phoneNumber: mobile)
              if (isValidateMobile == false) {
                 print("Incorrect Phone")
                 //return
              }
              if (isValidateEmail == true || isValidatePass == true || isValidateMobile == true) {
                 print("All fields are correct")
              }
       
       
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { authResult, error in
                
                if(authResult != nil)
                {
                    let alert = UIAlertController(title: "Alert", message: "Successfully Account Created !", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.txtEmail.text = ""
                    self.txtMobile.text = ""
                    self.txtPassword.text = ""
                
                }
            else
                {
                    let alert = UIAlertController(title: "Alert", message: "Something went wrong !", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
        }
     
    }
    

   

}
