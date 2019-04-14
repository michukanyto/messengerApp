//
//  ViewController.swift
//  messengerapp
//
//  Created by Marlon Escobar on 2019-04-12.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var ref:DatabaseReference!//1 to read
    var dataBaseHandle:DatabaseHandle!//3 to read
    var posData = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = posData[indexPath.row]
        return cell!
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
//        SET FIREBASE REFERENCE
        ref = Database.database().reference()//2 to read
        //RETRIVE THE POST AND LISTEN FOR CHANGES
        dataBaseHandle = ref?.child("Post").observe(.childAdded, with: { (snapshot) in //4 to read
            
      
            // CODE TO EXECUTE WHEN A CHILD IS ADDED UDER "Post"
            //TAKE THE VALUE FROM SNAPSHOT AND ADD IT TO posData ARRAY
            
            let post = snapshot.value as? String//5 to read
            if let actualPost = post{//6 to read
//                ADD NEW VALUES
                self.posData.append(actualPost)
//                RELOAD TABLEVIEW
                self.tableView.reloadData()
            }
            
        })
            
            
    }
}




