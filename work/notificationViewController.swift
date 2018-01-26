//
//  notificationViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/10/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let getLastRequestedLeaveURL = "https://fr129.wearedesigners.net/public/api/leavestatus"
let check1 = "valid"
let check2 = "invalid"
let check3 = "reject"
let check4 = "no more notification"
let check5 = "accept"
let check6 = "leave request still pending"

class notificationViewController: UIViewController {

    
    @IBOutlet weak var getNotificationLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNotificationLBL.text = ""
       // parse(email: selectedUserEmail)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkNotification(_ sender: AnyObject) {
        
        parse(email: selectedUserEmail)
    }

    
    //FUNCTION TO Post request
    func parse(email: String){
        
        let parameters: Parameters=[
            "email":email
           
        ]
        
        Alamofire.request(getLastRequestedLeaveURL, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    
                    var str: String? = jsonData.value(forKey: "success") as! String?
                    var msg: String? = jsonData.value(forKey: "message") as! String?
                    
                    if check1 == str {
                        
                        if check3 == msg{
                      self.getNotificationLBL.text = "Your requested leaves was REJECTED"
                        } else if check5 == msg {
                       self.getNotificationLBL.text = "Your requested leaves was ACCEPTED"
                        }
                        
                    } else {
                        
                        if check4 == msg {
                      self.getNotificationLBL.text = "You have no new notification regarding your requested leaves"
                        
                        } else if check6 == msg {
                       self.getNotificationLBL.text = "Your leave request still pending"
                        
                        }
                        
                        
                    }
                    
                    
                    
                }//end of if
        }
        
    } //func parse

   

}//class


























