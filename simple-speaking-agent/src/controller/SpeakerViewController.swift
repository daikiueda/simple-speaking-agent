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
    }
    
    override func viewWillAppear(animated: Bool) {
        self.enableActionCaptureForSpeaking()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
    func enableActionCaptureForSpeaking() {
        if let actionInterface = actionInterface {
            actionInterface.userInteractionEnabled = true
        }
    }
    
    func speak(actionType: SpeakingAction.ActionType) {
        guard let actionTitleDisplay = actionTitleDisplay else {
            return
        }
        
        if let speakingAction = self.settingManager.getActiveAction(actionType) {
            actionTitleDisplay.text = speakingAction.title
            speakingAction.speak()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let
            actionInterface = self.actionInterface,
            event = event
        else {
            return
        }
        
        let isValidTouch = event.touchesForView(actionInterface)
        if isValidTouch != nil && !isValidTouch!.isEmpty {
            self.speak(SpeakingAction.ActionType.Touch)
        }
    }
    
    
    // MARK: - Navigation
    
    @IBAction func restart(segue: UIStoryboardSegue) {
        
    }
}
