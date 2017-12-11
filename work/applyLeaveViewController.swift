//
//  applyLeaveViewController.swift
//  work
//
//  Created by Ranga Madushan on 12/11/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit
import MessageUI

class applyLeaveViewController: UIViewController,MFMailComposeViewControllerDelegate {

    override func viewDidLoad()
    {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBAction func back(_ sender: AnyObject)
    {
        
        let backToThird = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
        self.present(backToThird, animated: true)
        
    }
   
    @IBAction func sendEmail(_ sender: AnyObject)
    {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            
            showMailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController
    {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["madushandgr@gmail.com"])
        mailComposerVC.setSubject("Regarding Apply Leave")
        mailComposerVC.setMessageBody("Sir, Can I apply a leave for Date: ", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError()
    {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "your device could not send email", preferredStyle: .alert)
        
        let dismiss = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        controller.dismiss(animated: true, completion: nil)
    }
    
    

}
