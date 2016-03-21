//
//  ViewController.swift
//  Core Data
//
//  Created by Lovish Dogra on 22/03/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //Link the view controller with the appDelegate.
        let context: NSManagedObjectContext = appDel.managedObjectContext //Link the datamodel with the viewcontroller.
        
        //Uncomment this for adding the new data.
        /*
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) //Link the variable to save data in data model.
        
        //Assigning the new values
        newUser.setValue("Lovish", forKey: "username")
        newUser.setValue("Lov123", forKey: "password")
        
        //Save the context in the data model.
        do{
        try context.save()
        } catch{
        print("Error in saving the data")
        }
        */
        
        //Fetch the data from the data model.
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        //Using the predicate for searching the object
        request.predicate = NSPredicate(format: "username = %@", "Lovish")
        
        
        do{
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                
                for result in results as! [NSManagedObject]{
                    
                    //For deleting the value.
                    //context.deleteObject(result)
                    //For updating the value.
                    //result.setValue("Rajput", forKey:"username")
                    /*do{
                        try context.save()
                    } catch{
                        print("Error caught")
                    }
                    */
                    
                    print(result.valueForKey("username")!)
                    print(result.valueForKey("password")!)
                }
            }
        } catch{
            print("Error in fetching the data from the data model.")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

