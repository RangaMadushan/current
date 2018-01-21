//
//  MessagesHandler.swift
//  work
//
//  Created by Ranga Madushan on 1/21/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

protocol MessageReceviedDelegate: class {
    
    func messageReceived(senderID: String, senderName: String, text: String);
    
    func mediaReceived(senderID: String, senderName: String, url: String);
}

class MessagesHandler {

    private static let _instance = MessagesHandler();
    private init() {}
    
    weak var delegate: MessageReceviedDelegate?;
    
    static var Instance: MessagesHandler {
    
        return _instance;
    }
    
    
    //SEND TEXT MESSAGES
    func sendMessage(senderID: String, senderName: String, text: String) {
    
        let data: Dictionary<String, Any> = [Constants.SENDER_ID: senderID, Constants.SENDER_NAME: senderName, Constants.TEXT: text];
        
        DBProvider.Instance.messagesRef.childByAutoId().setValue(data);
    }
    
    
    
    func sendMediaMessage(senderID: String, senderName: String, url: String) {
        
        let data: Dictionary<String, Any> = [Constants.SENDER_ID: senderID, Constants.SENDER_NAME: senderName, Constants.URL: url];
       
        DBProvider.Instance.mediaMessagesRef.childByAutoId().setValue(data);
    }
    
    
    
    //SEND MEDIA MESSAGES
    func sendMedia(image: Data?, video: URL?, senderID: String, senderName: String){
    
        if image != nil {
            
            DBProvider.Instance.imageStorageRef.child(senderID + "\(NSUUID().uuidString).jpg").putData(image!, metadata: nil) { (metadata: StorageMetadata?, err: Error?)
            in
                if err != nil {
                    //inform the user that there was a problem uploading his image
                } else {
                    self.sendMediaMessage(senderID: senderID, senderName: senderName, url: String(describing: metadata!.downloadURL()!));
                }
            }
            
            
        } else {
            
            DBProvider.Instance.videoStorageRef.child(senderID + "\(NSUUID().uuidString)").putFile(from: video!, metadata: nil){ (metadata: StorageMetadata?, error: Error?) in
            
                if error != nil {
                
                    //inform the user that uploading the video has failed, using delegation
                } else {
                    self.sendMediaMessage(senderID: senderID, senderName: senderName, url: String(describing: metadata!.downloadURL()!));
                
                }
                
            }
            
        
        }
    
    }
    
    // when send new message observe it
    func observeMessages(){
        DBProvider.Instance.messagesRef.observe(DataEventType.childAdded)
        { (snapshot: DataSnapshot) in
            
            if let data = snapshot.value as? NSDictionary {
                if let senderID = data[Constants.SENDER_ID] as? String {
                    if let senderName = data[Constants.SENDER_NAME] as? String{
                    
                        if let text = data[Constants.TEXT] as? String {
                            self.delegate?.messageReceived(senderID: senderID, senderName: senderName, text: text);
                        }
                    
                    }
                }
            }
            
        }
    }
    
    
    func observeMediaMessages(){
        DBProvider.Instance.mediaMessagesRef.observe(DataEventType.childAdded) { (snapshot: DataSnapshot) in
        
            if let data = snapshot.value as? NSDictionary {
                if let id = data[Constants.SENDER_ID] as? String {
                    if let name = data[Constants.SENDER_NAME] as? String {
                        if let fileURL = data[Constants.URL] as? String {
                        
                            self.delegate?.mediaReceived(senderID: id, senderName: name, url: fileURL);
                        }
                    }
                }
            }
        }
        
        
    }

} //class











































