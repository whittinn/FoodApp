//
//  ViewTableExt.swift
//  FoodApp
//
//  Created by Nathaniel Whittington on 11/21/21.
//

import UIKit

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
      // 1
      let foodItem = foodItems[indexPath.row]
            
      // 2
      let foodType = foodItem.foodType
      cell.textLabel?.text = foodType
            
      // 3
      let foodDate = foodItem.addedFood as! Date
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMMM d yyyy, hh:mm"
            
      cell.detailTextLabel?.text = dateFormatter.string(from: foodDate)
            
      // 4
      if foodType == "Fruit" {
        cell.imageView?.image = UIImage(named: "Apple")
      }else{
        cell.imageView?.image = UIImage(named: "Salad")
      }

      return cell
    }
    
  
}


