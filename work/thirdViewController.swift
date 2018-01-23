//
//  thirdViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/9/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit

var myuser = selectedUserEmail;

class thirdViewController: UIViewController
{

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        label.text = "Welcome"
        
    }

    
    
    @IBAction func profile(_ sender: AnyObject)
    {
        
        performSegue(withIdentifier: "fourth", sender: self)
    }

    
    @IBAction func notification(_ sender: AnyObject)
    {
        performSegue(withIdentifier: "notification", sender: self)
    }
    
    
    @IBAction func exitButton(_ sender: AnyObject)
    {
        exit(0);
    }
   
    
    @IBAction func applyLeave(_ sender: AnyObject)
    {
        
        performSegue(withIdentifier: "applyLeaveSegue", sender: nil);
       /* let applyLeave = self.storyboard?.instantiateViewController(withIdentifier: "applyLeaveViewController") as! applyLeaveViewController
        self.present(applyLeave, animated: true) */
        
    }
    
    
    @IBAction func confirmOut(_ sender: AnyObject)
    {
        performSegue(withIdentifier: "confirmOutSegue", sender: nil);
       
    }
    
    
    
    @IBAction func confirmIn(_ sender: AnyObject)
    {
        
        performSegue(withIdentifier: "confirmInSegue", sender: nil)
       
    }
    
    @IBAction func logoutBtn(_ sender: AnyObject) {
        
    
        
    }
    
    @IBAction func goFrPrintBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "fingerprintSegue", sender: nil)
        
    }
    

} // class




























