//
//  ScheduleViewController.swift
//  work
//
//  Created by Ranga Madushan on 12/19/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var datePickerTxt: UITextField!
    @IBOutlet weak var datePicker2Txt: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createDatePicker()
        createDatePickerSecond()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
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
        datePicker2Txt.inputAccessoryView = toolbar
        
        //assigning datepicker to text field
        datePickerTxt.inputView = datePicker
        datePicker2Txt.inputView = datePicker
        
        
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
    
    func createDatePickerSecond()
    {
        //format for picker
        datePicker.datePickerMode = .date
        
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedSecond))
        toolbar.setItems([doneButton], animated: false)
        
        
    
        datePicker2Txt.inputAccessoryView = toolbar
        
        //assigning datepicker to text field
        
        datePicker2Txt.inputView = datePicker
        
        
    }
    
    func donePressedSecond()
    {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        datePicker2Txt.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    //for back
    @IBAction func backBtn(_ sender: AnyObject)
    {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "fourth") as! fourthViewController
        self.present(back, animated: true)
    }

  

}
