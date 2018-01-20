//
//  SignInVC.swift
//  work
//
//  Created by Ranga Madushan on 1/20/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    private let CONTACTS_SEGUE = "ContactsSegue"

    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func login(_ sender: AnyObject) {
        
        if emailTextfield.text != "" && passwordTextfield.text != ""
        {
            
            AuthProvider.Instance.login(withEmail: emailTextfield.text!, password: passwordTextfield.text!, loginHandler: { (message) in
                
                if message !=  nil {
                    
                    self.alertTheUser(title: "Problem With Authentication", message: message!);
                }else{
                    
                    print("LOGIN COMPLETED");
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
                }
                
            })
            
        }else{
        
            self.alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields");
        }

    }

    @IBAction func signUp(_ sender: AnyObject) {
        
        if emailTextfield.text != "" && passwordTextfield.text != ""
        {
            
                AuthProvider.Instance.signUp(withEmail: emailTextfield.text!, password: passwordTextfield.text!, loginHandler: { (message) in
                    
                    if message != nil {
                    
                        self.alertTheUser(title: "Problem With Creating A New User", message: message!);
                        
                    }else{
                    
                        print("SIGNUP COMPLETED");
                        self.emailTextfield.text = ""
                        self.passwordTextfield.text = ""
                        
                        self.performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
                        
                    }
                    
                    
                })
        
            
        }else{
            
            self.alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields");
        }
        
        
        
    }
    
    
    private func alertTheUser(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }

}//class










































