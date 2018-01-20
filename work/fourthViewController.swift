//
//  fourthViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/10/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController
{
    
    @IBAction func scheduleButton(_ sender: AnyObject)
    {
        
        let toSchedule = self.storyboard?.instantiateViewController(withIdentifier: "Schedule") as! ScheduleViewController
        self.present(toSchedule, animated: true)
        
        
    }

    @IBAction func leaveBalanceBtn(_ sender: AnyObject)
    {
        let toChart = self.storyboard?.instantiateViewController(withIdentifier: "showChart") as! showChartViewController
        self.present(toChart, animated: true)
        
    }
    @IBAction func goToChatBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "signInVC", sender: self)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
