//
//  SpeakerViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/03/21.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class SpeakerViewController: UIViewController, UINavigationBarDelegate {

    @IBOutlet private dynamic weak var navBar: UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navBar = navBar {
            navBar.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
    @IBAction func restart(segue: UIStoryboardSegue) {
        
    }
}
