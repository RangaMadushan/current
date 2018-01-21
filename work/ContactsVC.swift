//
//  ContactsVC.swift
//  work
//
//  Created by Ranga Madushan on 1/20/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, FetchData {

    @IBOutlet weak var myTable: UITableView!
    
    private let CELL_ID = "Cell";
    
    private var contacts = [Contact]();
    //create a Contact type array to get name and id
   
    override func viewDidLoad() {
        super.viewDidLoad()

        DBProvider.Instance.delegate = self;
        
        DBProvider.Instance.getContacts();
        
        self.myTable.dataSource = self
        self.myTable.delegate = self
        self.myTable.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func dataReceived(contacts: [Contact]) {
        self.contacts = contacts;
        
        //get the name of current user
        
        myTable.reloadData();
    }

    
    //relevant table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath);
        
        cell.textLabel?.text = contacts[indexPath.row].name;
        
        return cell;
    }
    //close of the relavant table
    
    @IBAction func logout(_ sender: AnyObject) {

        if AuthProvider.Instance.logOut() {
            dismiss(animated: true, completion: nil);
        }
    }
  

} //class

































