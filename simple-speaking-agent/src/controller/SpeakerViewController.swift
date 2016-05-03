//
//  SpeakerViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/03/21.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class SpeakerViewController: UIViewController,  UINavigationBarDelegate {

    @IBOutlet private dynamic weak var navBar: UINavigationBar?
    @IBOutlet private dynamic weak var actionInterface: UIView?
    @IBOutlet private dynamic weak var actionTitleDisplay: UILabel?
    
    // TODO: やむをえずシングルトン
    private let settingManager = SettingsManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navBar = navBar {
            navBar.delegate = self
        }
        
        if let actionInterface = actionInterface {
            actionInterface.userInteractionEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.speak(SpeakingAction.ActionType.Touch)
    }
    
    func prepareActionCaptureForSpeaking() {
        
    }
    
    func speak( action: SpeakingAction.ActionType ) {
        print(action)
    }
    
    
    // MARK: - Navigation
    
    @IBAction func restart(segue: UIStoryboardSegue) {
        
    }
}
