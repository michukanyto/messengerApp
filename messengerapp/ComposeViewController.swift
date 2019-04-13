//
//  ComposeViewController.swift
//  messengerapp
//
//  Created by Marlon Escobar on 2019-04-12.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit
import FirebaseDatabase//1

class ComposeViewController: UIViewController {
    var ref:DatabaseReference!//2
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()//3

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPost(_ sender: UIBarButtonItem) {
        // TODO : post the data to Firebase
        ref!.child("Post").childByAutoId().setValue(textView.text)//4
        //Dimmiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelPost(_ sender: UIBarButtonItem) {
        //Dimmiss the popover
        presentedViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
