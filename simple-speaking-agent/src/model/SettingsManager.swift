//
//  SettingsManager.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/21.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation

class SettingsManager {
    
    private var speakingActions: [SpeakingAction] = []
    
    private var activeActions: [SpeakingAction.ActionType:SpeakingAction] = [:]
    
    init(){
        self.load()
    }
    
    func load(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let storedData = userDefaults.objectForKey("speakingActions") as? NSData,
            unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as? [SpeakingAction] {
            self.speakingActions = unarchivedData
        } else {
            self.speakingActions = [
                SpeakingAction(title: "しょきち")
            ]
        }
        
        self.setActiveActions()
    }
    
    func save(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let speakingActions = NSKeyedArchiver.archivedDataWithRootObject(self.speakingActions)
        userDefaults.setObject(speakingActions, forKey: "speakingActions")

        userDefaults.synchronize()
    }
    
    func getSpeakingActions() -> Array<SpeakingAction> {
        return self.speakingActions
        
    }
    
    func getActiveAction(actionType: SpeakingAction.ActionType) -> SpeakingAction? {
        return self.activeActions[actionType]
    }
    
    func setActiveActions() {
        for actionType in SpeakingAction.ActionType.cases() {
            self.activeActions[actionType] = self.speakingActions.filter({actionSetting -> Bool in
                return actionSetting.actionType == actionType && actionSetting.isActive
            }).first
            self.activeActions[actionType]?.prepareSpeaker()
        }
    }
    
    func registorSpeakingAction(targetSpeakingAction: SpeakingAction) {
        if !self.speakingActions.contains({ (speakingAction) -> Bool in
            return targetSpeakingAction === speakingAction
        }) {
            self.speakingActions.append(targetSpeakingAction)
        }
        self.save()
        self.setActiveActions()
    }
    
    static let sharedInstance: SettingsManager = SettingsManager()
}