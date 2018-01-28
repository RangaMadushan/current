//
//  RateOtherViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/27/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class RateOtherViewController: UIViewController {

    var giveFeedbackURL = "https://fr129.wearedesigners.net/public/api/givefeedback"
    var getCurrentRankURL = "https://fr129.wearedesigners.net/public/api/getrank"
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var CurrentRankLable: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var reviewer = selectedUserEmail
    var reviewee = selectedArrayEmail[myIndex]
    var myRank = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       nameLable.text = selectedArrayName[myIndex]
       emailLabel.text = selectedArrayEmail[myIndex]
   //  CurrentRankLable.text = selectedRank[myIndex]
        
        self.parsing(email: reviewee)

       
        
        
        
    }
    
    
    @IBAction func oneStarBtn(_ sender: AnyObject) {
        
        //self.parse(reviewee: reviewee, reviewer: reviewer, rank: 1)
       self.parsing(email: reviewee)
    }
    
    
    @IBAction func twoStarBtn(_ sender: AnyObject) {
        self.parse(reviewee: reviewee, reviewer: reviewer, rank: 2)
        self.parsing(email: reviewee)

    }
    
    
    @IBAction func threeStarBtn(_ sender: AnyObject) {
        
        self.parse(reviewee: reviewee, reviewer: reviewer, rank: 3)
        self.parsing(email: reviewee)

    }
    
    
    @IBAction func fourStarBtn(_ sender: AnyObject) {
        
        self.parse(reviewee: reviewee, reviewer: reviewer, rank: 4)
        self.parsing(email: reviewee)

    }
    
    
    @IBAction func fiveStarBtn(_ sender: AnyObject) {
        
        self.parse(reviewee: reviewee, reviewer: reviewer, rank: 5)
        self.parsing(email: reviewee)

    }

    
    func parse(reviewee: String, reviewer: String, rank: Int){
        
        let parameters: Parameters=[
            "reviewee":reviewee,
            "reviewer":reviewer,
            "rank":rank
        ]
        
        Alamofire.request(giveFeedbackURL, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    
                    
                    var str: String? = jsonData.value(forKey: "message") as! String?
                    
                    self.callAlert(message: str!)
                    
                    
                    
                }
        }
        
    } //func parse

    
    //func parsing for get current rank
    func parsing(email: String) {
        
        let parameters: Parameters=[
            "email":reviewee
            
        ]
        
        Alamofire.request("https://fr129.wearedesigners.net/public/api/getrank", method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response);
                
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    
                    
                   // var rank: String? = jsonData.value(forKey: "message") as! String?
                   // var myRank = jsonData.value(forKey: "message") as! String
                    var abc = jsonData.value(forKey: "message") as! Double
                    
                    
                    self.CurrentRankLable.text = "\(abc)"
                    
                  
                    
                }
        }
        
    } //func parsing for get current rank
   
    
    //func alert calling
    func callAlert(message: String){
        
        let alertController = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        { (action:UIAlertAction!) in
            
            print("Ok button tapped")
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    } //func alert calling end
    
    
    
 

} //class
