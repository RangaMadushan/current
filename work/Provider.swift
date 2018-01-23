//
//  Provider.swift
//  work
//
//  Created by Ranga Madushan on 1/23/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation


class Provider {
    
    private static let _instance = Provider()
    //this is for create instance of Authprovider to use everywhere
    static var Instance: Provider {
        return _instance;
    }
    
    var userName = "";
    
    // func for get date
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }//func get date
    
    
   
    
    

    
    
    
    
    
    
    
    } //class




































