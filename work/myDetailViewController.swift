//
//  myDetailViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/23/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class myDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var startDate:[String] = [] //needs
    var endDate:[String] = []
    var titlesName:[String] = ["First Name","Last Name", "date of birt", "Email", "Working Hours"]
    var myArray = [String]()
    var myArray2 = [String]()
    var myArray3 = [String]()
    
    let URL_USER_DETALIS = "http://fr129.wearedesigners.net/public/api/employee"
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        parsingData(email: selectedUserEmail)
        self.tableView.dataSource = self
        self.tableView.delegate = self
       // parseData()
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
        
        
        cell?.textLabel?.text = titlesName[indexPath.row] as? String
        cell?.detailTextLabel?.text = myArray[indexPath.row] as? String
        return cell!
        
        
    }
    //END OF TABLE VIEW
    
    func parsingData(email: String)
    {
        let parameters: Parameters = ["email":email]
        
        
        Alamofire.request(URL_USER_DETALIS, method: .post, parameters: parameters).responseJSON {response in
        
            
                
                if let result = response.result.value
                {
                    let jsonData = result as! NSDictionary
                    
                    var firstname = jsonData.value(forKey: "firstname") as! String
                    print(firstname)
                    self.myArray.append(firstname)
                    print(self.myArray);
                    
                    var lastname = jsonData.value(forKey: "lastname") as! String
                    print(lastname)
                    self.myArray.append(lastname)
                    print(self.myArray)
                    
                    var dob = jsonData.value(forKey: "dob") as! String
                    print(dob)
                    self.myArray.append(dob)
                    print(self.myArray)
                    
                    
                    var email = jsonData.value(forKey: "email") as! String
                    print(email)
                    self.myArray.append(email)
                    print(self.myArray)
                    
                    var workinghours = jsonData.value(forKey: "workinghours") as! String
                    print(workinghours)
                    self.myArray.append(workinghours)
                    print(self.myArray)
                    
                    
                    self.tableView.reloadData()
                    
                }
        }
    }// func parsing data

    func parseData()
    {
        request(URL_USER_DETALIS).responseJSON
            { response in
                //print(response) //methandi enne object widiyta {}mehema
                
                if let result = response.result.value
                {
                    //print(result); //methan enneth object wagemai
                    let data = JSON(result)
                    //print(data);
                    
                    for i in 0..<data.count
                    {
                        let name = data[i]["FirstName"]
                        self.myArray.append(name.string!)
                    }
                    //print(self.myArray);
                    self.tableView.reloadData()
                    
                }
        }
    }// func parse data

   

}//class




























