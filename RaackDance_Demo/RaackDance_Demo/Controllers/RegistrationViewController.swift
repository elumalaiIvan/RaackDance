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
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var mailIDTF: UITextField!
    @IBOutlet weak var classTypeTF: UITextField!
    
    lazy var reference:FIRDatabaseReference = {
        
        let ref = FIRDatabase.database().reference(withPath: "Students")
        return ref
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
           }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
        
        guard let name = nameTF.text, name != "" else {
            //alert 
            showAlert("Enter the name")
            return
        }
        guard let mobileNumber = mobileNumberTF.text, mobileNumber != "" else {
            //alert
            showAlert("enter the mobile number")
            return
        }
        guard let mailID = mailIDTF.text, mailID != "" else {
            //alert
            showAlert("enter the mail ID")
            return
        }
        guard let classType = classTypeTF.text, classType != "" else {
            //alert
            showAlert("enter the classType")
            return
        }
        
        var student = Student(name: name, mobileNumber: mobileNumber, mailId: mailID)
        student.save()
    
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Please consider", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
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
