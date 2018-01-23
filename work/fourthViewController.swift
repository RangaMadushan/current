//
//  fourthViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/10/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit


var profileUserEmail = selectedUserEmail


class fourthViewController: UIViewController
{
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func scheduleButton(_ sender: AnyObject)
    {
        performSegue(withIdentifier: "scheduleSegue", sender: nil)
        /*let toSchedule = self.storyboard?.instantiateViewController(withIdentifier: "Schedule") as! ScheduleViewController
         self.present(toSchedule, animated: true)*/
        
        
    }
    
    //BUTTONS
    
    @IBAction func leaveBalanceBtn(_ sender: AnyObject)
    {
        
        performSegue(withIdentifier: "showChartSegue", sender: nil)
        /*let toChart = self.storyboard?.instantiateViewController(withIdentifier: "showChart") as! showChartViewController
         self.present(toChart, animated: true)*/
        
    }
    @IBAction func goToChatBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "signInVC", sender: self)
        
    }
    
    
  
    
    @IBAction func goPattern(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "patternSegue", sender: nil)
    }
    

    @IBAction func myRankBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "myRankSegue", sender: nil)
        
    }
    
    
    @IBAction func myDetailBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "myDetailSegue", sender: nil)
        
    }
    
    
    
    @IBAction func goHistoryBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "showHistorySegue", sender: nil)
    }
    
    
    
    @IBAction func goExtraBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "showExtraSegue", sender: nil)
    }
    
    
    //END OF BUTTONS
  

}//class








































