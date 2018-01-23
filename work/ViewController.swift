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
let myURL = "http://fr129.wearedesigners.net/public/api/loginattempt"
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
        
        self.parse(useremail: a!, password: b!);
        
    }
    
    func parse(useremail: String, password: String){
        
        let parameters: Parameters=[
            "useremail":useremail,
            "password":password
        ]
        
        Alamofire.request(myURL, method: .post, parameters: parameters).responseJSON
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
                        self.gotoNext()
                       // selectedUserEmail = self.usernameText.text!
                        
                        
                        
                        
                        
                    } else {
                        
                        self.callAlert(message: "CAN'T VALIDATE YOU AS AN AUTHORIZED USER")
                        self.label.text = ""
                        self.passwordText.text = ""
                    }
                    
                    

                }
        }
        
    }
    
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

