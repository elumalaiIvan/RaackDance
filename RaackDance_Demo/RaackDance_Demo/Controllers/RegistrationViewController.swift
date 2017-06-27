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
    @IBOutlet weak var profilePicButton: UIButton!
    
    
    var picker:UIImagePickerController?=UIImagePickerController()
    
    
    lazy var reference:FIRDatabaseReference = {
        
        let ref = FIRDatabase.database().reference(withPath: "Students")
        return ref
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicButton.layer.cornerRadius = profilePicButton.frame.size.width/2
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
    
    @IBAction func profilePicButtonTapped(_ sender: UIButton) {
        
        callThePhotonSharingOption()
    }
    
    @IBAction func deleteAllButtonTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Warning", message: "Do you want to delete the all the student data?", preferredStyle: UIAlertControllerStyle.alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (action) in
            self.reference.removeValue()
        }
        let cancelAction = UIAlertAction(title: "Delete", style:.cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func sendXLButtonTapped(_ sender: UIButton) {
        
        
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

    
    extension RegistrationViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        func callThePhotonSharingOption() {
            let camera = CameraHandler(delegate_: self)
            let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            optionMenu.popoverPresentationController?.sourceView = self.view
            
            let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { (alert : UIAlertAction!) in
                camera.getCameraOn(self)
            }
            let sharePhoto = UIAlertAction(title: "Photo Library", style: .default) { (alert : UIAlertAction!) in
                camera.getPhotoLibraryOn(self)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert : UIAlertAction!) in
            }
            optionMenu.addAction(takePhoto)
            optionMenu.addAction(sharePhoto)
            optionMenu.addAction(cancelAction)
            self.present(optionMenu, animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            
            let image = info[UIImagePickerControllerEditedImage] as! UIImage
            profilePicButton.setImage(image, for: .normal)
            
            // image is our desired image
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
   
