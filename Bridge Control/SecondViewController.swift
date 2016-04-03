//
//  SecondViewController.swift
//  Bridge Control
//
//  Created by Sergey Bavykin on 4/2/16.
//  Copyright © 2016 Sergey Bavykin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var engineSwitch: UISwitch!
    @IBOutlet weak var warpFactorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillEnterForeground:", name: UIApplicationWillEnterForegroundNotification, object: app)
    }

    func refreshFields() {
        let defaults = NSUserDefaults.standardUserDefaults()
        engineSwitch.on = defaults.boolForKey(warpDriveKey)
        warpFactorSlider.value = defaults.floatForKey(warpFactorKey)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEngineSwitchTapped(sender: UISwitch) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(engineSwitch.on, forKey: warpFactorKey)
        defaults.synchronize()
    }

    @IBAction func onWarpSliderDragged(sender: UISlider) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }
    
    @IBAction func onSettingsButtonTapped(sender: UIButton) {
    
    }
    
    func applicationWillEnterForeground(notification: NSNotification) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        refreshFields()
    }
}

