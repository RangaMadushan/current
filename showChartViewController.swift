//
//  showChartViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/18/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import ShinobiCharts
import Alamofire
import SwiftyJSON

var chooseArray = [Int]()

class showChartViewController: UIViewController
{
    var languageName:[String] = ["Medical","casual","annual"]
    var languageData = [Int]()
    var array:[Int] = [5,5,5]

    @IBOutlet weak var medicleLabel: UILabel!
    
    @IBOutlet weak var annualLabel: UILabel!
    
    @IBOutlet weak var casualLabel: UILabel!
    
    @IBOutlet weak var chart: ShinobiChart!
    
   // let languageData = ProgrammingLanguageDataStore.generate()

    override func viewDidLoad()
    {
        super.viewDidLoad()
      //  chooseArray = parsing(email: selectedUserEmail)
        parsing(email: selectedUserEmail)
        ShinobiCharts.trialKey = "cXFg-fVgB-V1sA-ayZ9-NHhc-DVRV"
        chart.datasource = self
        chart.delegate = self
    }
    
    //FOR BAC BUTTON
    @IBAction func backy(_ sender: AnyObject) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "fourth") as! fourthViewController
        self.present(back, animated: true)
    }
    
   
    func parsing (email:String) ->[Int] {
        
        
        //creating parameters for the post request
        let parameters: Parameters=[
            
            "email":email
        ]
        
        
        //Sending http post request
        Alamofire.request("http://employeeanalyzerapi.milandawijekoon.me/api/availableleaves", method: .post, parameters: parameters).responseJSON
            {
                response in
                
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    
                    
                    
                    
                    
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    var medicle = jsonData.value(forKey: "medical") as! Int
                   // print(medicle)
                    self.languageData.append(medicle)
                   // print(self.languageData);
                    self.medicleLabel.text = "\(medicle)"
                    
                    var annual = jsonData.value(forKey: "annual") as! Int
                   // print(annual)
                    self.languageData.append(annual)
                   // print(self.languageData);
                    self.annualLabel.text = "\(annual)"
                    
                    var casual = jsonData.value(forKey: "casual") as! Int
                   // print(casual)
                    self.languageData.append(casual)
                   // print(self.languageData);
                    self.casualLabel.text = "\(casual)"
                    
                    
                   
                    
                    
                    
                }
                
                
        }
        
        return languageData
        
        
    }//func

  
    
   
    

  

}//class

extension showChartViewController: SChartDatasource
{

    func numberOfSeries(in chart: ShinobiChart) -> Int {
        return 1
    }
    
    func sChart(_ chart: ShinobiChart, seriesAt index: Int) -> SChartSeries {
        let series = SChartPieSeries()
        
        series.style().labelFont = UIFont.systemFont(ofSize: 15)
        series.selectedStyle().protrusion = 30
        
        series.gesturePanningEnabled = true
        
        return series
    }
    func sChart(_ chart: ShinobiChart, numberOfDataPointsForSeriesAt seriesIndex: Int) -> Int {
        return 3
    }
    
    func sChart(_ chart: ShinobiChart, dataPointAt dataIndex: Int, forSeriesAt seriesIndex: Int) -> SChartData {
        // chooseArray = parsing(email: "sanda@gmail.com")
        let mm = languageName[dataIndex]
        let nn = array[dataIndex]
        
        let datapoint = SChartRadialDataPoint()
        datapoint.name = mm
        datapoint.value = nn as NSNumber?

        
        
        
        return datapoint
    }

}

extension showChartViewController: SChartDelegate
{

    func sChart(_ chart: ShinobiChart, alter label: UILabel, for datapoint: SChartRadialDataPoint, atSlice index: Int, in series: SChartRadialSeries) {
        label.text = datapoint.name
    }
    
}
