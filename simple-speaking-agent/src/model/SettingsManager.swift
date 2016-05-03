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
        self.speakingActions = [
            SpeakingAction(title: "しょきち")
        ]
        
        self.setActiveActions()
    }
    
    func save(){
        
    }
    
    func getSpeakingActions() -> Array<SpeakingAction> {
        return self.speakingActions
    }
    
    func setActiveActions() {
        for actionType in SpeakingAction.ActionType.cases() {
            self.activeActions[actionType] = self.speakingActions.filter({actionSetting -> Bool in
                return actionSetting.actionType == actionType && actionSetting.isActive
            }).first
        }
        
        print(self.activeActions)
    }
    
    func registorSpeakingAction(targetSpeakingAction: SpeakingAction) {
        if !self.speakingActions.contains({ (speakingAction) -> Bool in
            return targetSpeakingAction === speakingAction
        }) {
            print("append")
            self.speakingActions.append(targetSpeakingAction)
        }
    }
    
    static let sharedInstance: SettingsManager = SettingsManager()
}