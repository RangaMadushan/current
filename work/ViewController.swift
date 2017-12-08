//
//  ViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/8/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate
{

    let URL_USER_LOGIN = "http://mineranga.000webhostapp.com/login.php"
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var label: UILabel!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameText.delegate = self //keyboard eka awama hidden karana
        
        self.passwordText.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }

    @IBAction func registerHere(_ sender: AnyObject)
    {
        
        performSegue(withIdentifier: "second", sender: self)
    }

    
    @IBAction func login(_ sender: AnyObject)
    {
        
        
        //getting the username and password
        let parameters: Parameters=[
            "username":usernameText.text!,
            "password":passwordText.text!
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value
                {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userPhone = user.value(forKey: "phone") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userPhone, forKey: "userphone")
                        
                        //switching the screen
                        //performSegue(withIdentifier: "third", sender: self)
                        self.label.text = "succesfully loged in"
                        
                    }else{
                        //error message in case of invalid credential
                        self.label.text = "Invalid username or password"
                    }
                }
           }
        
      
    }
    
    //hide the keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    //keyboard enter karam ain wenna
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
        return (true)
    }
    
    
    
    
}

