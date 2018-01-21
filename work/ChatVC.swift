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

class ChatVC: JSQMessagesViewController, MessageReceviedDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var messages = [JSQMessage]();
    
    let picker = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self;
        MessagesHandler.Instance.delegate = self;
        
        self.senderId = AuthProvider.Instance.userID();
        self.senderDisplayName = AuthProvider.Instance.userName;
        
        MessagesHandler.Instance.observeMessages();

    }
    
    //START OF THE COLLECTION VIEW FUNCTION
    
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
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, didTapMessageBubbleAt indexPath: IndexPath!) {
        
        let msg = messages[indexPath.item];
        
        if msg.isMediaMessage {
            if let mediaItem = msg.media as? JSQVideoMediaItem {
                let player = AVPlayer(url: mediaItem.fileURL);
                let playerController = AVPlayerViewController();
                playerController.player = player;
                self.present(playerController, animated: true, completion: nil);
            }
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count;
    } //func of JSQ to load message similar like tableView

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell;
        
    } //func of JSQ to load message similar like tableView
    
    //END OF THE COLLECTION VIEW FUNCTION
    
    
    // START OF THE SENDING BUTTON FUNCTIONS
    
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        MessagesHandler.Instance.sendMessage(senderID: senderId, senderName: senderDisplayName, text: text);
       
       /* messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text));
        collectionView.reloadData()
       */
        finishSendingMessage();
        //this will remove my typed text from the textfield
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        
        let alert = UIAlertController(title: "Media Messages", message: "Please Select A Media", preferredStyle: .actionSheet);
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        
        let photos = UIAlertAction(title: "Photos", style: .default, handler: { (alert: UIAlertAction) in
            self.chooseMedia(type: kUTTypeImage);
        })
        
        let videos = UIAlertAction(title: "Videos", style: .default, handler: { (alert: UIAlertAction) in
            self.chooseMedia(type: kUTTypeMovie);

        })
        
        alert.addAction(photos);
        alert.addAction(videos);
        alert.addAction(cancel);
        present(alert, animated: true, completion: nil);
        
    } //this one for sending images
    
    //END OF THE SENDING BUTTON FUNCTION
    
    
    //START PICKER VIEW FUNCTION
    
    private func chooseMedia(type: CFString) {
        picker.mediaTypes = [type as String]
        present(picker, animated: true, completion: nil);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pic = info[UIImagePickerControllerOriginalImage] as? UIImage{
        
            let data = UIImageJPEGRepresentation(pic, 0.01);
            
            MessagesHandler.Instance.sendMedia(image: data, video: nil, senderID: senderId, senderName: senderDisplayName);
            
        }else if let vidURL = info[UIImagePickerControllerMediaURL] as? URL{
        
            MessagesHandler.Instance.sendMedia(image: nil, video: vidURL, senderID: senderId, senderName: senderDisplayName);
            
        }
        self.dismiss(animated: true, completion: nil);
        collectionView.reloadData();
    }
    
    //END PICKER VIEW FUNCTION
    
    
    
    //  STATR DELEGATION FUNCTIONS

    func messageReceived(senderID: String, senderName: String, text: String) {
        messages.append(JSQMessage(senderId: senderID, displayName: senderName, text: text));
        collectionView.reloadData();
    }
    
    //  END DELEGATION FUNCTIONS

    
    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil);
    }

    

} //class













































