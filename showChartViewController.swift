//
//  showChartViewController.swift
//  work
//
//  Created by Ranga Madushan on 1/18/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import ShinobiCharts

class showChartViewController: UIViewController
{

    @IBOutlet weak var chart: ShinobiChart!
    
    let languageData = ProgrammingLanguageDataStore.generate()

    @IBAction func backy(_ sender: AnyObject) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "fourth") as! fourthViewController
        self.present(back, animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        ShinobiCharts.trialKey = "cXFg-fVgB-V1sA-ayZ9-NHhc-DVRV"
        chart.datasource = self
        chart.delegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this action not valid
    @IBAction func backBtn(_ sender: AnyObject)
    {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "fourth") as! fourthViewController
        self.present(back, animated: true)
    }
    

  

}

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
        return languageData.count
    }
    
    func sChart(_ chart: ShinobiChart, dataPointAt dataIndex: Int, forSeriesAt seriesIndex: Int) -> SChartData {
        let language = languageData[dataIndex]
        
        let datapoint = SChartRadialDataPoint()
        datapoint.name = language.name
        datapoint.value = language.popularity as NSNumber?
        
        
        
        return datapoint
    }

}

extension showChartViewController: SChartDelegate
{

    func sChart(_ chart: ShinobiChart, alter label: UILabel, for datapoint: SChartRadialDataPoint, atSlice index: Int, in series: SChartRadialSeries) {
        label.text = datapoint.name
    }
    
}
