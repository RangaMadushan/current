//
//  ViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/8/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var selectedUserEmail = ""
var selectedPassword = ""
let myLoginURL = "http://fr129.wearedesigners.net/public/api/loginattempt"
let s = "validation successful"


class ViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var label: UILabel!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //For hide the keyboard
        self.usernameText.delegate = self
        self.passwordText.delegate = self

    }
    

    
    @IBAction func login(_ sender: AnyObject)
    {
        let a = usernameText.text
        let b = passwordText.text
        checkReachability()
        self.parse(useremail: a!, password: b!);
        
    }
    
    func parse(useremail: String, password: String){
        
        let parameters: Parameters=[
            "useremail":useremail,
            "password":password
        ]
        
        Alamofire.request(myLoginURL, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.label.text = jsonData.value(forKey: "message") as! String?
                    
                    var str: String? = jsonData.value(forKey: "message") as! String?
                    
                    if s == str {
                        
                        //self.callAlert(message: "YOU SUCCESFULLY LOGGED")
                        selectedUserEmail = self.usernameText.text!
                        selectedPassword = self.passwordText.text!
                        self.gotoNext()
                       // selectedUserEmail = self.usernameText.text!
                        
                        
                        
                        
                        
                    } else {
                        if((self.usernameText.text?.isEmpty)! || (self.passwordText.text?.isEmpty)!){
                        self.callAlert(message: "ALL FIELDS ARE REQUIRED TO FILL IN")
                            self.label.text = ""
                            
                        } else if ((self.passwordText.text?.characters.count)! < 6){
                        self.callAlert(message: "PASSWORD LENGTH SHOULD BE EQUAL OR MORE THAN 6 CHARACTER")
                            self.label.text = ""
                            self.passwordText.text = ""
                            
                        }else if !(self.isValidEmailAddress(emailAddressString: self.usernameText.text!)){
                        self.callAlert(message: "EMAIL ADDRESS IS NOT A VALID ONE")
                            self.label.text = ""
                            self.passwordText.text = ""
                        }
                        else {
                        self.callAlert(message: "CAN'T VALIDATE YOU AS AN AUTHORIZED USER")
                        self.label.text = ""
                        self.passwordText.text = ""
                        }
                    }
                    
                    

                }
        }
        
    } //func parse
    
    
    //func validate email address
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }//func validate email address
    
    
    //func for check connection
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
        }else if currentReachabilityStatus == .reachableViaWWAN{
            print("User is connected to the internet via WWAN.")
        } else {
            self.callAlert(message: "There is no internet connection")
        }
    }
    //func check connection
    
    
    
    
    //func alert calling
    func callAlert(message: String){
        
        let alertController = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        { (action:UIAlertAction!) in
            
            print("Ok button tapped")
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    func gotoNext() {
        let applyLeave = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
        self.present(applyLeave, animated: true)
        
        performSegue(withIdentifier: "thirdSegue", sender: nil)
    } 

    
    
    //hide the keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    //keyboard hide when touch the enter key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
        return (true)
    }
    
    
    
    
} //class

