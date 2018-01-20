//
//  AuthProvider.swift
//  work
//
//  Created by Ranga Madushan on 1/20/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation
import FirebaseAuth


typealias LoginHandler = (_ msg: String?) -> Void

//these are messages to handel error msg
struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid Email Address, Please Provide A Real Email Address";
    
    static let WRONG_PASSWORRD = "Wrong Password, Please Enter The Correct Password";
    
    static let PROBLEM_CONNECTING = "Here is Problem Connecting To Database";
    
    static let USER_NOT_FOUND = "User Not Found, Please Register";
    
    static let EMAIL_ALREADY_IN_USE = "Email Already In Use, Please Use Another Email";
    
    static let WEAK_PASSWORD = "Password Should Be At least 6 Chracters Long";
    
}


class AuthProvider {
    
    private static let _instance = AuthProvider()
    //this is for create instance of Authprovider to use everywhere
    static var Instance: AuthProvider {
        return _instance;
    }
    
    
    func login(withEmail: String, password: String, loginHandler: LoginHandler?){
        
        
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: { (user, error) in
            
            if error != nil{
                
                self.handleErrors(err: error as! NSError, loginHandler: loginHandler)
            }else{
                
                loginHandler?(nil)
                
            }
            
        })
    } //login func
    
    
    private func handleErrors(err: NSError, loginHandler: LoginHandler?){
        
        if let errCode = AuthErrorCode(rawValue: err.code){
            
            switch errCode{
                
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORRD);
                break;
                
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL);
                break;
                
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND);
                
                break;
                
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE);
                break;
                
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD);
                break;
                
            default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING);
                
                break;
                
                
            }
        }
        
    }
    
}//class



















