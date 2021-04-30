//
//  LoginViewController.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    public var db = Firestore .firestore()

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCreateAccountClick(_ sender: Any) {
        
        let vc = (self.storyboard?.instantiateViewController(identifier: "CreateAccountView"))! as CreateAccountViewController
       self.present(vc,animated: true,completion: nil)
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        
        var status : Bool = false
        var msg : String = ""
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (authResult, error) in
            
                  if let error = error as NSError? {
                  switch AuthErrorCode(rawValue: error.code) {
                  case .operationNotAllowed:
                    msg = "Email is not allowed..!"
                      break
                  case .userDisabled:
                    msg = "The user account has been disabled by an administrator."
                  break
                  case .invalidEmail:
                    msg = "The email address is badly formatted."
                  break
                  case .wrongPassword:
                    msg = "The user name or password is invalid "
                    break
                  default:
                    msg = "Error"
                  }
                } else {
                    msg = "User signs in successfully..!"
                    status = true
                }
            
            if(status)
            {
              
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "tbBarController") as! UITabBarController
                newViewController.modalPresentationStyle = .fullScreen
                        self.present(newViewController, animated: true, completion: nil)
                
                
            }
            else
            {
                let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }
    }
    
    @IBAction func btnResetPasswordClick(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(identifier: "ResetPassword"))! as ResetPassword
       self.present(vc,animated: true,completion: nil)
        
    }

}
