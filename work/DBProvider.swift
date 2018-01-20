//
//  DBProvider.swift
//  work
//
//  Created by Ranga Madushan on 1/20/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DBProvider {
    
    private static let _instance = DBProvider();
    
    //this private init for confirm any other class cannot allowed this object
    private init() {}
    
        static var Instance: DBProvider {
        
            return _instance;
        }
    
    //database for store normal data
    var dbRef: DatabaseReference {
        
        return Database.database().reference();
        
    }
    
    var contactsRef: DatabaseReference {
    
        return dbRef.child(Constants.CONTACTS);
        
    }
    
    var messagesRef: DatabaseReference {
    
        return dbRef.child(Constants.MESSAGES);
        
    }
    
    var mediaMessagesRef: DatabaseReference {
        
        return dbRef.child(Constants.MEDIA_MESSAGES);
        
    }
    
    //storage for images, video etc
    var storageRef: StorageReference {
        
        return Storage.storage().reference(forURL: "gs://work-886c4.appspot.com");
        
    }
    
    var imageStorageRef: StorageReference{
    
        return storageRef.child(Constants.IMAGE_STORAGE);
    }
    
    
    var videoStorageRef: StorageReference{
        
        return storageRef.child(Constants.VIDEO_STORAGE);
    }
    
    func saveUser(withID: String, email: String, password: String){
    
        let data: Dictionary<String, Any> = [Constants.EMAIL: email, Constants.PASSWORD: password];
        
        contactsRef.child(withID).setValue(data);
    }//func saveUser
    
}// class








































