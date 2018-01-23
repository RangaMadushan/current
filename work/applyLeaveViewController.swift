//
//  applyLeaveViewController.swift
//  work
//
//  Created by Ranga Madushan on 12/11/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit
import MessageUI
import Alamofire
import SwiftyJSON


let sss = "valid"

class applyLeaveViewController: UIViewController,MFMailComposeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var datePickerTxt: UITextField!
    @IBOutlet weak var noOfLeaveTxt: UITextField!
    @IBOutlet weak var leaveTypeTxt: UITextField!
    
    var leaveType = ["medical","annual","casual"]
    var currentTime = Provider.Instance.currentTime() as String;
    var leaveDate = ""
    let applyLeaveURL = "http://fr129.wearedesigners.net/public/api/leaveapply"
    let admin = "bithuntersuom@gmail.com"
    
    
    let datePicker = UIDatePicker()
    let picker = UIPickerView()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        createDatePicker()
        picker.delegate = self
        picker.dataSource = self
        
        //binding leavetypetext to picker
        leaveTypeTxt.inputView = picker

    
    }


    
    @IBAction func back(_ sender: AnyObject)
    {
        
        let backToThird = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
        self.present(backToThird, animated: true)
        
    } //back button
   
    @IBAction func sendEmail(_ sender: AnyObject)
    {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            
            showMailError()
        }
    } //SEND EMAIL BUTTON
    
    
    @IBAction func sendToDatabase(_ sender: AnyObject) {
        
        
        
        var noOfleave:Int = Int(noOfLeaveTxt.text!)!
        
        parse(appliedtime: Provider.Instance.currentTime(), leavedate: datePickerTxt.text!, empemail: selectedUserEmail, leavetype: leaveTypeTxt.text!, noofdays: noOfleave)
        
        
    } //SEND TO DATABASE BUTTON
    
    
    //FUNCTION TO Post request
    func parse(appliedtime: String, leavedate: String, empemail: String, leavetype: String, noofdays: Int ){
        
        let parameters: Parameters=[
            "appliedtime":appliedtime,
            "leavedate":leavedate,
            "empemail":empemail,
            "leavetype":leavetype,
            "noofdays":noofdays
        ]
        
        Alamofire.request(applyLeaveURL, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    
                    var str: String? = jsonData.value(forKey: "success") as! String?
                    
                    if sss == str {
                        
                        self.callAlert(message: "SUCCESFULLY UPDATED TO THE DATABASE");
                        
                    } else {
                        
                        self.callAlert(message: "COULDN'T UPDATE SUCCESFULLY")
                        
                    }
                    
                    
                    
                }
        }
        
    } //func parse

    
    
    //END OF THE PPOST REQUEST
    
    
    
    //RELEVANT TO MAIL COMPOSER
    func configureMailController() -> MFMailComposeViewController
    {
   
        var body:String = "Sir, Can I apply leave for DATE : \(datePickerTxt.text) TYPE :\(leaveTypeTxt)  NO:OF LEAVE I WANT :\(noOfLeaveTxt)"
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["bithuntersuom@gmail.com"])
        mailComposerVC.setSubject("Regarding Apply Leave")
        mailComposerVC.setMessageBody(body, isHTML: false)
        
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
    //END OF MAIL COMPOSER
    
    
    
    
    
    
    //FUNCTION RELEVANT TO PICK LEAVE TYPE
    //for picker view
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return leaveType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return leaveType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        leaveTypeTxt.text = leaveType[row]
        self.view.endEditing(true)
    }
    //for picker view

    
    
    
    //FUNCTION END
    
    
    //FUNCTION RELEVANT TO DATEPICKER
    func createDatePicker()
    {
        //format for picker
        datePicker.datePickerMode = .date
        
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        
        datePickerTxt.inputAccessoryView = toolbar
        
        //assigning datepicker to text field
        datePickerTxt.inputView = datePicker
        
    }
    
    func donePressed()
    {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        datePickerTxt.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
     //END OF DATE PICKER FUNCTION
    
    
    func callAlert(message: String){
        
        let alertController = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        { (action:UIAlertAction!) in
            
            print("Ok button tapped")
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }// end func call alert
    

}//class
