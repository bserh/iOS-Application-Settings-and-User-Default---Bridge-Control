//
//  FirstViewController.swift
//  Bridge Control
//
//  Created by Sergey Bavykin on 4/2/16.
//  Copyright © 2016 Sergey Bavykin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var officerLabel: UILabel!
    @IBOutlet weak var authorizationCodeLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var warpDriveLabel: UILabel!
    @IBOutlet weak var warpFactorLabel: UILabel!
    @IBOutlet weak var favoriteTeaLabel: UILabel!
    @IBOutlet weak var favoriteCaptainLabel: UILabel!
    @IBOutlet weak var favoriteGagetLabel: UILabel!
    @IBOutlet weak var favoriteAlienLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillEnterForeground:", name: UIApplicationWillEnterForegroundNotification, object: app)
    }

    func refreshFields() {
        let defaults = NSUserDefaults.standardUserDefaults()
        officerLabel.text = defaults.stringForKey(officerKey)
        authorizationCodeLabel.text = defaults.stringForKey(authorizationCodeKey)
        rankLabel.text = defaults.stringForKey(rankKet)
        warpDriveLabel.text = defaults.boolForKey(warpDriveKey) ? "Engaged" : "Disabled"
        warpFactorLabel.text = defaults.objectForKey(warpFactorKey)?.stringValue
        favoriteTeaLabel.text = defaults.stringForKey(favoriteTeaKey)
        favoriteCaptainLabel.text = defaults.stringForKey(favoriteCaptainKey)
        favoriteGagetLabel.text = defaults.stringForKey(favoriteGadgetKey)
        favoriteAlienLabel.text = defaults.stringForKey(favoriteAlienKey)
    }
    
    func applicationWillEnterForeground(notification: NSNotification) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        refreshFields()
    }

}

