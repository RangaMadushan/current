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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        /*let toConfirmOut = self.storyboard?.instantiateViewController(withIdentifier: "confirmOut") as! confirmOutViewController
        self.present(toConfirmOut, animated: true)
        */
    }
    
    
    
    @IBAction func confirmIn(_ sender: AnyObject)
    {
        
        performSegue(withIdentifier: "confirmInSegue", sender: nil)
        /*let toConfirmIn = self.storyboard?.instantiateViewController(withIdentifier: "confirmIn") as! confirmInViewController
        self.present(toConfirmIn, animated: true)
        */
    }
    
    @IBAction func logoutBtn(_ sender: AnyObject) {
        
    
        
    }
    

} // class




























