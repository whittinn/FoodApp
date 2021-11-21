//
//  ViewController.swift
//  FoodApp
//
//  Created by Nathaniel Whittington on 11/20/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var foodItems = [Food]()
    
    @IBOutlet weak var tableView: UITableView!
    var moc : NSManagedObjectContext!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        moc = appDelegate?.persistentContainer.viewContext
        self.tableView.dataSource = self
        
        loadData()
    }
    
    
    func loadData(){
       // 1
       let foodRequest:NSFetchRequest<Food> = Food.fetchRequest()
            
       // 2
       let sortDescriptor = NSSortDescriptor(key: "addedFood", ascending: false)
       foodRequest.sortDescriptors = [sortDescriptor]
            
       // 3
       do {
           try foodItems = moc.fetch(foodRequest)
       }catch {
           print("Could not load data")
       }
            
       // 4
       self.tableView.reloadData()
    }
    

    @IBAction func addFoodButton(_ sender: UIButton) {
        
        let foodItems = Food(context: moc)
        
        foodItems.addedFood = Date()
        
        if sender.tag == 0 {
            
            foodItems.foodType = "Fruits"
        }else{
            
            foodItems.foodType = "Vegetables"
        }
        
        appDelegate?.saveContext()
        
        loadData()
        
    }
    
    
   
}

