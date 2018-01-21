//
//  Contact.swift
//  work
//
//  Created by Ranga Madushan on 1/21/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation

class Contact {

    private var _name = ""
    private var _id = ""
    
    init(id: String, name: String) {
        _id = id;
        _name = name;
    }
    
    var name: String {
        get {
            return _name;
        }
    }

    var id: String {
    
        return _id;
        //we can have getter by itself
    }
}










































