//
//  SettingsManager.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/21.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation

class SettingsManager {
    
    var speakingActions:[SpeakingActionSetting] = []
    
    init(){
        self.load()
    }
    
    func load(){
        self.speakingActions = [
            SpeakingActionSetting(title: "しょきち")
        ]
    }
    
    func save(){
        
    }
    
    func getSpeakingActions() -> Array<SpeakingActionSetting> {
        return self.speakingActions
    }
}