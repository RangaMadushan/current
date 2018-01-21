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

//create a protocol for func dataReceived
protocol FetchData: class {
    func dataReceived(contacts: [Contact]);
}

class DBProvider {
    
    private static let _instance = DBProvider();
    
    weak var delegate: FetchData?;
    
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
    
    
    func getContacts() {
        
        
        contactsRef.observeSingleEvent(of: DataEventType.value) {
            (snapshot: DataSnapshot) in
            
            var contacts = [Contact]();
            
            if let myContacts = snapshot.value as? NSDictionary {
            
                for (key, value) in myContacts {
                    if let contactData = value as? NSDictionary {
                        if let email = contactData[Constants.EMAIL] as? String{
                        
                            let id = key as! String;
                            let newContact = Contact(id: id, name: email);
                            contacts.append(newContact);
                        }
                    }
                }
            }
            self.delegate?.dataReceived(contacts: contacts);
        }
        
    }//func to fetch database data
    
}// class








































