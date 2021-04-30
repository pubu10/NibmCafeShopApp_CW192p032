//
//  StoreController.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//

import UIKit

class StoreController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Preview: UIView!
    @IBOutlet weak var Category: UIView!
    @IBOutlet weak var Menu: UIView!
    
    @IBAction func SegmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
                case 0:
                    Preview.isHidden = false
                    Category.isHidden = true
                    Menu.isHidden = true
                case 1:
                    Preview.isHidden = true
                    Category.isHidden = false
                    Menu.isHidden = true
                case 2:
                    Preview.isHidden = true
                    Category.isHidden = true
                    Menu.isHidden = false
                default:
                    Preview.isHidden = false
                    
                }
    }
}
