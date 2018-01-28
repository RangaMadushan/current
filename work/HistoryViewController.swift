//
//  HistoryViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/23/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myArray = [String]()
    var myArray2 = [String]()
    var myArray3 = [String]()
    
    var userRecordHistoryURL = "http://fr129.wearedesigners.net/public/api/viewrecord"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parsingData(email: selectedUserEmail)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    //START OF TABLE VIEW
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myArray.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UITableViewCell
        
        
        cell?.textLabel?.text = myArray2[indexPath.row] as? String
        cell?.detailTextLabel?.text = myArray[indexPath.row] as? String
        return cell!
        
        
    }
    //END OF TABLE VIEW

   
    func parsingData(email: String)
    {
        let parameters: Parameters = ["email":email]
        
        
        Alamofire.request(userRecordHistoryURL, method: .post, parameters: parameters).responseJSON {response in
            
            
            
            if let result = response.result.value
            {
                let data = JSON(result)
                
                for i in 0..<data.count
                {
                    
                    
                    
                    var Date = data[i]["Date"]
                    self.myArray.append(Date.string!)
                    
                    
                    var RecordTime = data[i]["RecordTime"]
                    self.myArray.append(RecordTime.string!)
                    
                    
                    var Status = data[i]["Status"]
                    self.myArray.append(Status.string!)
                    
                    
                    
                    var Description = data[i]["Description"]
                    self.myArray.append(Description.string!)
                    
                    
                    var fill1 = "*************"
                    self.myArray.append(fill1)
                    
                    
                    var fill2 = "*************"
                    self.myArray.append(fill2)
                    
                    self.myArray2.append("Date")
                    self.myArray2.append("Recorded Time")
                    self.myArray2.append("Status")
                    self.myArray2.append("Description")
                    self.myArray2.append("*************")
                    self.myArray2.append("*************")
                }
                
                self.tableView.reloadData()
                
            }
        }
    }// func parsing data
    

    

}//class


























