//
//  thirdViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/9/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
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
   
    @IBAction func applyLeave(_ sender: AnyObject) {
        
        let applyLeave = self.storyboard?.instantiateViewController(withIdentifier: "applyLeaveViewController") as! applyLeaveViewController
        self.present(applyLeave, animated: true)
        
    }
    

}
