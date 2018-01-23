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
    var tname:[String] = []
    var myArray = [String]()
    var myArray2 = [String]()
    var myArray3 = [String]()
    
    let URL_USER_DETALIS = "http://fr129.wearedesigners.net/public/api/user"
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        parseData()
        
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
        //cell?.detailTextLabel?.text = myArray2[indexPath.row] as? String
        return cell!
        
        
    }
    //END OF TABLE VIEW

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
    }

   

}//class




























