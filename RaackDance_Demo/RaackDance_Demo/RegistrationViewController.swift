//
//  RegistrationViewController.swift
//  RaackDance_Demo
//
//  Created by Elumalai Ramalingam on 17/05/17.
//  Copyright © 2017 Elumalai Ramalingam. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    lazy var reference:FIRDatabaseReference = {
        
        let ref = FIRDatabase.database().reference(withPath: "Students")
        return ref
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groceryItem = GroceryItem(name: "malai",
                                      addedByUser: "malai@gmail.com",
                                      completed: false)
        //let groceryItemRef = self.reference.child("malai".lowercased())
        self.reference.setValue(groceryItem.toAnyObject())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
