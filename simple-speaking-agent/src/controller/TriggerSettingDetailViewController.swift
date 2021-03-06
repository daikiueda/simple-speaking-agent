//
//  TriggerSettingDetailViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/27.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class TriggerSettingDetailViewController: UIViewController {
    
    @IBOutlet private dynamic weak var actionTitleInput: UITextField?

    var speakingAction:SpeakingAction?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        guard let
            speakingAction = self.speakingAction,
            actionTitleInput = actionTitleInput else {
            return
        }
        
        actionTitleInput.text = speakingAction.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateSpeakingAction() {
        guard let
            speakingAction = self.speakingAction,
            actionTitleInput = actionTitleInput else {
            return
        }
        
        speakingAction.title = actionTitleInput.text!
        
        // TODO: - ダミー値
        speakingAction.actionType = SpeakingAction.ActionType.Touch
        speakingAction.soundType = SpeakingAction.SoundType.Synthe
        speakingAction.isActive = true
    }
    

    // MARK: - Navigation

    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
        if unwindSegue.identifier == "backToListWithUpdatedAction" {
            self.updateSpeakingAction()

            let dest = unwindSegue.destinationViewController as! TriggerSettingListViewController
            if let speakingAction = self.speakingAction {
                dest.updateSpeakingAction(speakingAction)
            }
        }
    }
}
