//
//  resetPasswordViewController.swift
//  work
//
//  Created by Ranga Madushan on 2/1/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class resetPasswordViewController: UIViewController {

    @IBOutlet weak var currentEmailTxt: UITextField!
    
    @IBOutlet weak var currentPWTxt: UITextField!
    
    @IBOutlet weak var newPasswordTxt: UITextField!
    
    

    var resetPWURL = "http://employeeanalyzerapi.milandawijekoon.me/api/updatepassword"
  //  var resetPWURL = "https://fr129.wearedesigners.net/public/api/updatepassword"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    
    @IBAction func resetConfirmBtn(_ sender: AnyObject) {
        
        if currentEmailTxt.text!.isEmpty || currentPWTxt.text!.isEmpty || newPasswordTxt.text!.isEmpty {
        
            self.callAlert(message: "ALL FIELDS ARE REQUIRED TO FILL IN")
            
    }else if currentEmailTxt.text! != selectedUserEmail || currentPWTxt.text! != selectedPassword {
            
            self.callAlert(message: "FILL YOUR CURRENT EMAIL AND PASSWORD CORRECTLY")
            
        } else if newPasswordTxt.text!.characters.count < 6 {
            
            self.callAlert(message: "YOUR NEW PASSWORD LENGTH ALSO SHOULD BE EQUAL OR MORE THAN SIX CHARACTER")
        
        }else {
            
        parse(useremail: self.currentEmailTxt.text!, password: self.currentPWTxt.text!, newpassword: self.newPasswordTxt.text!)
        performSegue(withIdentifier: "backToLoginSegue", sender: nil)
            
        }
        
    }

    
    
    func parse(useremail: String, password: String, newpassword: String){
        
        let parameters: Parameters=[
            "useremail":useremail,
            "password":password,
            "newpassword":newpassword
        ]
        
        Alamofire.request(resetPWURL, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    var q: String? = jsonData.value(forKey: "success") as! String?
                    var r: String? = jsonData.value(forKey: "message") as! String?
                    
                    
                        
                 
                    
                }
                
                }
        }//func parse
    
    
//    func gotoNext() {
//        let goLogin = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.present(goLogin, animated: true)
//        
//        performSegue(withIdentifier: "backToLoginSegue", sender: nil)
//    }
    
    
    
    //func alert calling
    func callAlert(message: String){
        
        let alertController = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        { (action:UIAlertAction!) in
            
            print("Ok button tapped")
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }//func call alert


}//class

























