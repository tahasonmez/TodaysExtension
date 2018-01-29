//
//  TodayViewController.swift
//  TodaysExtensionExample
//
//  Created by Taha Sönmez on 29.01.2018.
//  Copyright © 2018 Taha Sönmez. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var eventDateLabel: UILabel!
    @IBOutlet var eventLocationLabel: UILabel!
    
    let userDefaults = UserDefaults.init(suiteName: "group.TodaysExtensionExample")
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        retrieveData()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        eventDateLabel.alpha = 0
        eventLocationLabel.alpha = 0
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        setUpLayout()
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 170)
        }
    }
    func setUpLayout() {
        
        let isExpanded = self.extensionContext?.widgetActiveDisplayMode == .expanded
        if isExpanded == true {
           
            UIView.animate(withDuration: 0.2, animations: {
                self.eventNameLabel.font = UIFont(name: "HelveticaNeue", size: 24)
                
                self.eventDateLabel.frame.origin.y = self.eventDateLabel.frame.origin.y + 20
                self.eventDateLabel.alpha = 1
                self.eventLocationLabel.alpha = 1
                self.eventLocationLabel.frame.origin.y = self.eventLocationLabel.frame.origin.y + 20
                
            })
            
            
           
        }
        else {
            UIView.animate(withDuration: 0.2, animations: {
                self.eventNameLabel.font = UIFont(name: "HelveticaNeue", size: 17)
                self.eventDateLabel.alpha = 0
                self.eventLocationLabel.alpha = 0
                self.eventDateLabel.frame.origin.y = self.eventDateLabel.frame.origin.y - 20
                self.eventLocationLabel.frame.origin.y = self.eventLocationLabel.frame.origin.y - 20
            })
        }
    }
    func retrieveData() {
        self.eventNameLabel.text = userDefaults?.string(forKey: "eventName")
        self.eventDateLabel.text = userDefaults?.string(forKey: "eventDate")
        self.eventLocationLabel.text = userDefaults?.string(forKey: "eventLocation")
    }
    @IBAction func goButtonTapped(_ sender: Any) {
        if let url = URL(string: "com.sonmez.TodaysExtension://") {
            
            self.extensionContext?.open(url as URL, completionHandler:nil)
            
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
       
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
