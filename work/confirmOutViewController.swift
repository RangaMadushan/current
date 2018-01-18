//
//  confirmOutViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/17/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit

class confirmOutViewController: UIViewController
{

    @IBOutlet weak var datePickerTxt: UITextField!
    
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createDatePicker()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createDatePicker()
    {
        //format for picker
        datePicker.datePickerMode = .dateAndTime
        
        
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
        dateFormatter.timeStyle = .short
        
        datePickerTxt.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func backButton(_ sender: AnyObject)
    {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
        self.present(back, animated: true)
    }

    @IBAction func confirmBtn(_ sender: AnyObject)
    {
        
    }
    
  
}
