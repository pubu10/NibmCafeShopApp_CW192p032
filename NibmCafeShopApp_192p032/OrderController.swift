//
//  OrderController.swift
//  NibmCafeShopApp_192p032
//
//  Created by pubudu tharuka on 2021-04-30.
//

import UIKit

class OrderController: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let foodCell = tblView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodTableViewCell
                  foodCell.foodImageCell.image = UIImage(named: self.foods[indexPath.row].foodImage ?? "")
                  foodCell.lblFoodName.text = self.foods[indexPath.row].foodName
                  foodCell.lblFoodDesc.text = self.foods[indexPath.row].foodDesc
                  foodCell.lblFoodPrice.text = "Rs. \(self.foods[indexPath.row].foodPrice ?? "")"
                  foodCell.lblFoodOffer.text = "\(self.foods[indexPath.row].foodOffer ?? "")%"
                  if(foodCell.lblFoodOffer.text == ("0%"))
                  {
                      foodCell.lblFoodOffer.isHidden = true;
                  }
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
