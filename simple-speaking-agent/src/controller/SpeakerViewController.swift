//
//  SpeakerViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/03/21.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class SpeakerViewController: UIViewController, UINavigationBarDelegate {

    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
    @IBAction func restart(segue :UIStoryboardSegue) {
        
    }
}
