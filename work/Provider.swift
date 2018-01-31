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
    //this is for create instance of provider to use everywhere
    static var Instance: Provider {
        return _instance;
    }
    
    
    func currentDate() -> String{
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        return "\(day)/\(month)/\(year)"
        
    }// func to get current date
    
    func currentTime() -> String{
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        return "\(hour):\(minutes):\(seconds)"
        
    }// func to get current time
    
    
    
    
   
    
    

    
    
    
    
    
    
    
    } //class




































