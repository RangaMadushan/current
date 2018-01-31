//
//  myRankViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/23/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var myIndex = 0
var selectedArrayEmail = [String]()
var selectedArrayName = [String]()
var selectedRank = [String]()

class myRankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myArray = [String]()
    var myArray2 = [String]()
    var myArray3 = [String]()
    
    let URL_Employe_Rank = "http://fr129.wearedesigners.net/public/api/getfeedback"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        parseData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        performSegue(withIdentifier: "rankSegue", sender: self)
    }
    
    //END OF TABLE VIEW

    func parseData()
    {
        request(URL_Employe_Rank).responseJSON
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
                        let rank = data[i]["Rank"]
                        self.myArray2.append("\(rank)")
                        let email = data[i]["EmailAddress"]
                        self.myArray3.append(email.string!)
                    }
                    //print(self.myArray);
                    self.tableView.reloadData()
                    selectedArrayEmail = self.myArray3
                    selectedArrayName = self.myArray
                    selectedRank = self.myArray2
                }
        }
    }// func parse data


}//class














