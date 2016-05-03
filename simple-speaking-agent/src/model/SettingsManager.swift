//
//  SettingsManager.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/21.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation

class SettingsManager {
    
    private var speakingActions: [SpeakingActionSetting] = []
    
    private var activeActions: [SpeakingActionSetting.ActionType:SpeakingActionSetting] = [:]
    
    init(){
        self.load()
    }
    
    func load(){
        self.speakingActions = [
            SpeakingActionSetting(title: "しょきち")
        ]
        
        self.setActiveActions()
    }
    
    func save(){
        
    }
    
    func getSpeakingActions() -> Array<SpeakingActionSetting> {
        return self.speakingActions
    }
    
    func setActiveActions() {
        for actionType in SpeakingActionSetting.ActionType.cases() {
            self.activeActions[actionType] = self.speakingActions.filter({actionSetting -> Bool in
                return actionSetting.actionType == actionType && actionSetting.isActive
            }).first
        }
        
        print(self.activeActions)
    }
    
    func registorSpeakingAction(targetSpeakingAction: SpeakingActionSetting) {
        if !self.speakingActions.contains({ (speakingAction) -> Bool in
            return targetSpeakingAction === speakingAction
        }) {
            print("append")
            self.speakingActions.append(targetSpeakingAction)
        }
    }
    
    static let sharedInstance: SettingsManager = SettingsManager()
}