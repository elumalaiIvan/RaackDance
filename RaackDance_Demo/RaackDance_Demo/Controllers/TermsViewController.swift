//
//  TermsViewController.swift
//  RaackDance_Demo
//
//  Created by Elumalai Ramalingam on 17/05/17.
//  Copyright © 2017 Elumalai Ramalingam. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DisAgreeButtonTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Information", message: "It is crucial to agree the terms and condition", preferredStyle: .alert)
        let DefaultalertAction = UIAlertAction(title: "OK I Agree", style: .default) { (action) in
            self.dismissTheControllerWith(agree: true)
            
        }
        let CancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
            self.dismissTheControllerWith(agree: false)        }
        
        alertController.addAction(DefaultalertAction)
        alertController.addAction(CancelAlertAction)
        
    }
    @IBAction func AgreeButtonTapped(_ sender: UIButton) {
        
        dismissTheControllerWith(agree: true)
    }
    
    func dismissTheControllerWith(agree:Bool){
        
        let defaultStorage = UserDefaults.standard
        defaultStorage.set(agree, forKey: "isTCAgreed")
        
        self.dismiss(animated: true, completion: nil)
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
