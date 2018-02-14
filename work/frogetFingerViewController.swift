//
//  frogetFingerViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/23/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class frogetFingerViewController: UIViewController {

    
    var myArray = [String]()
    var getAdminMsg = "http://employeeanalyzerapi.milandawijekoon.me/api/iosadminmessage"
   // var getAdminMsg = "https://fr129.wearedesigners.net/public/api/iosadminmessage"
    
    
    @IBOutlet weak var notificationLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationLBL.text = ""
        
    }

    @IBAction func checkNotifications(_ sender: AnyObject) {
        
        parse(email: selectedUserEmail)
    }
    
    
    @IBAction func goConfirmOut(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "goToOutSegue", sender: nil)
        
    }
    
    
    @IBAction func goConfirmIn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "goToINSegue", sender: nil)
        
    }
    

    //FUNCTION TO Post request
    func parse(email: String){
        
        let parameters: Parameters=[
            "email":email
            
        ]
        
        Alamofire.request(getAdminMsg, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    
                    var c1: String? = jsonData.value(forKey: "success") as! String?
                    
                  
                    if c1 == "invalid" {
                    
                        var c3: String? = jsonData.value(forKey: "message") as! String?
                        print(c3!)
                        self.notificationLBL.text! = c3!
                    
                    }else{
                        
                        var c2: String? = jsonData.value(forKey: "Content") as! String?
                        
                        print(c2!)
                        self.notificationLBL.text = c2!
                        
                        }
                    
                    
                    
                    
                    
            
    
        


                    
                    
                    
                }//end of if
        }
        
    } //func parse

   

}//class





























