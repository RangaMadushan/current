//
//  ChatVC.swift
//  work
//
//  Created by Ranga Madushan on 1/21/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import MobileCoreServices
import AVKit


//AVKit for play video

class ChatVC: JSQMessagesViewController {
    
    private var messages = [JSQMessage]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.senderId = "1";
        self.senderDisplayName = "ranga";

    }
    
    //Begining of the collection View Functions
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let bubbleFactory = JSQMessagesBubbleImageFactory();
       // let message = messages[indexPath.item];
        return bubbleFactory?.outgoingMessagesBubbleImage(with: UIColor.blue);
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        return JSQMessagesAvatarImageFactory.avatarImage(with: UIImage(named: "icons8-profile-filled.png"), diameter: 30);
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count;
    } //func of JSQ to load message similar like tableView

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell;
        
    } //func of JSQ to load message similar like tableView
    
    //end of the collection view functions
    
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text));
        collectionView.reloadData()
        
        finishSendingMessage();
        //this will remove my typed text from the textfield
    }
    
    
    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil);
    }

    

} //class













































