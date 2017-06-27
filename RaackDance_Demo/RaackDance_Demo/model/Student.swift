//
//  Student.swift
//  RaackDance_Demo
//
//  Created by Aravind Lakshmanan on 6/22/17.
//  Copyright © 2017 Elumalai Ramalingam. All rights reserved.
//

import Foundation


import Foundation
import Firebase

struct Student {
    let name: String
    let mobileNumber: String
    let mailId: String
    lazy var reference:FIRDatabaseReference = {
        let ref = FIRDatabase.database().reference(withPath: "Students")
        return ref
    }()
    var classType: String
    var key:String
    var profileUrl:String = ""
    
    init(name: String, mobileNumber: String, mailId: String, classType: String = "Fork") {
        self.key = "\(name)\(mobileNumber)"
        self.name = name
        self.mobileNumber = mobileNumber
        self.mailId = mailId
        self.classType = classType
    }
    
    mutating func save(){
        
        let studentRef = reference.child(key.lowercased())
        
        studentRef.setValue(self.toAnyObject()) { (error, studentRef) in
            
            if error == nil {
                
                print("student data saved successfully")
                
            }else{
                
                print("error observed \(String(describing: error?.localizedDescription))")
                
            }
            
        }
        
    }
    
    private mutating func generateKeyforTheStudent(){
        
        key = "\(name)\(mobileNumber)"
    }
    
//    init(snapshot: FIRDataSnapshot) {
//        key = snapshot.key
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        name = snapshotValue["name"] as! String
//        ref = snapshot.ref
//    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "mobileNumber": mobileNumber,
            "mailId": mailId,
            "classType":classType,
            "address":["firstLine":name,"secondName":mobileNumber],
            "profileURL":profileUrl
        ]
    }
    
}
