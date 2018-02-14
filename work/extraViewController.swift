//
//  extraViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/23/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class extraViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
   
    var myArray = [String]()
    var myArray2 = [String]()
    var myArray3 = [String]()
    
    var userProjectURL = "http://employeeanalyzerapi.milandawijekoon.me/api/employeeproject"
  //  var userProjectURL = "http://fr129.wearedesigners.net/public/api/employeeproject"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parsingData(email: selectedUserEmail)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        
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
        
        
        Alamofire.request(userProjectURL, method: .post, parameters: parameters).responseJSON {response in
            
            
            
            if let result = response.result.value
            {
                let data = JSON(result)
                
                for i in 0..<data.count
                {
                
                
                
                var Name = data[i]["Name"]
                self.myArray.append(Name.string!)
                
                
                var ProjectStartDate = data[i]["ProjectStartDate"]
                self.myArray.append(ProjectStartDate.string!)
               
                
                var ProjectEndDate = data[i]["ProjectEndDate"]
                self.myArray.append(ProjectEndDate.string!)
                
                
                
                var PartHandled = data[i]["PartHandled"]
                self.myArray.append(PartHandled.string!)
                
                
                var PartStartDate = data[i]["PartStartDate"]
                self.myArray.append(PartStartDate.string!)
                
                
                var PartEndDate = data[i]["PartEndDate"]
                self.myArray.append(PartEndDate.string!)
                
                
                var fill1 = "*************"
                self.myArray.append(fill1)
                
                
                var fill2 = "*************"
                self.myArray.append(fill2)
                    
                self.myArray2.append("Project Name")
                self.myArray2.append("Project Start Date")
                self.myArray2.append("Project Should End")
                self.myArray2.append("My Part")
                self.myArray2.append("Part Started date")
                self.myArray2.append("Part Should End")
                self.myArray2.append("*************")
                self.myArray2.append("*************")
                }
                
                self.tableView.reloadData()
                
            }
        }
    }// func parsing data
    

   

} //class

























