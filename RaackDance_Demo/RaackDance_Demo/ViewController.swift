//
//  ViewController.swift
//  RaackDance_Demo
//
//  Created by Elumalai Ramalingam on 16/05/17.
//  Copyright © 2017 Elumalai Ramalingam. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    //let ref = FIRDatabase.database().reference(withPath: "grocery-items")
    
    lazy var reference:FIRDatabaseReference = {
        
        let ref = FIRDatabase.database().reference(withPath: "Students")
        return ref
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // let ref = FIRDatabase.database().reference(withPath: "Students")
        
        let groceryItem = GroceryItem(name: "malai",
                                      addedByUser: "malai@gmail.com",
                                      completed: false)
        //let groceryItemRef = self.reference.child("malai".lowercased())
        self.reference.setValue(groceryItem.toAnyObject())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

