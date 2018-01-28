//
//  notificationViewController.swift
//  work
//
//  Created by Ranga Madushan on 11/10/17.
//  Copyright © 2017 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let getLastRequestedLeaveURL = "https://fr129.wearedesigners.net/public/api/leavestatus"
let getMyLeaveDetails = "https://fr129.wearedesigners.net/public/api/leave"
let check1 = "valid"
let check2 = "invalid"
let check3 = "no more pending"
let check4 = "last leave is still pending"
let check5 = "accept"
let check6 = "leave request still pending"

class notificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myArray = [String]()
    var myArray2 = [String]()
    var myArray3 = [String]()
    
    @IBOutlet weak var getNotificationLBL: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNotificationLBL.text = ""
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
//        parse(email: selectedUserEmail)
//        parseData(email: selectedUserEmail)
       // self.tableView.reloadData()
       // parse(email: selectedUserEmail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkNotification(_ sender: AnyObject) {
        
        parse(email: selectedUserEmail)
        parseData(email: selectedUserEmail)
      
    }
    
    
    //START OF TABLE VIEW
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myArray.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UITableViewCell
        
        
        cell?.textLabel?.text = myArray[indexPath.row] as? String
        cell?.detailTextLabel?.text = myArray2[indexPath.row] as? String
        return cell!
        
        
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            myArray.remove(at: indexPath.row)
            myArray2.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    //END OF TABLE VIEW
    


    
    //FUNCTION TO Post request
    func parse(email: String){
        
        let parameters: Parameters=[
            "email":email
           
        ]
        
        Alamofire.request(getLastRequestedLeaveURL, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    
                    var str: String? = jsonData.value(forKey: "success") as! String?
                    var msg: String? = jsonData.value(forKey: "message") as! String?
                    
                    
                    
                    
                    if check1 == str {
                        
                        if check4 == msg{
                      self.getNotificationLBL.text = "Your last leave request still PENDING"
                        } else if check3 == msg {
                       self.getNotificationLBL.text = "You have not any pending request, Already responsed"
                        }
                        
                    } else {
                        
                      self.getNotificationLBL.text = "you can't request leaves"
                        
                        
                        
                        
                    }
                    
                    
                    
                }//end of if
        }
        
    } //func parse
    
    
    //func for parsing table
    func parseData(email: String)
    {
        let parameters: Parameters=[
            "email":email
            
        ]
        
        Alamofire.request(getMyLeaveDetails, method: .post, parameters: parameters).responseJSON
            { response in
                //print(response) //methandi enne object widiyta {}mehema
                
                if let result = response.result.value
                {
                    //print(result); //methan enneth object wagemai
                    let data = JSON(result)
                    //print(data);
                    
                    for i in 0..<data.count
                    {
                        let date = data[i]["LeaveStartDate"]
                        self.myArray.append(date.string!)
                        
                        var acceptance = data[i]["AcceptReject"]
                        
                        if acceptance == nil  {
                        
                        acceptance = "pending"
                        self.myArray2.append(acceptance.string!)
                        }else{
                        
                        self.myArray2.append(acceptance.string!)
                        }
                        }
                    
                    
                    self.tableView.reloadData()
                    
                }
        }
    }// func parsing table data
    

   

}//class


























