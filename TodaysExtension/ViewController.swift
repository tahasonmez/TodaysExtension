//
//  ViewController.swift
//  TodaysExtension
//
//  Created by Taha Sönmez on 29.01.2018.
//  Copyright © 2018 Taha Sönmez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var eventName: UITextField!
    
    @IBOutlet var eventDate: UITextField!
    
    @IBOutlet var eventLocation: UITextField!
    
     let userDefaults = UserDefaults.init(suiteName: "group.TodaysExtensionExample")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(_ sender: Any) {
        userDefaults?.set(eventName.text, forKey: "eventName")
        userDefaults?.set(eventDate.text, forKey: "eventDate")
        userDefaults?.set(eventLocation.text, forKey: "eventLocation")
        }
    
}

