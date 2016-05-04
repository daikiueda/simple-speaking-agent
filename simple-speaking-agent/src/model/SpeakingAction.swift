//
//  SpeakingActionSetting.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/24.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation
import AVFoundation

class SpeakingAction: NSObject, NSCoding {
    
    var title: String? = "みせってい"
    
    var isActive: Bool = false
    
    var actionType: ActionType?
    
    var targetKey: String?
    
    var soundType: SoundType?
    
    var speaker: Speakable?
    
    init(title: String?) {
        if let title = title {
            self.title = title
        }
        
        self.actionType = SpeakingAction.ActionType.Touch
        self.soundType = SpeakingAction.SoundType.Synthe
        self.isActive = true
    }
    
    required init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey("title") as? String
        self.isActive = aDecoder.decodeBoolForKey("isActive")
        self.actionType = ActionType(rawValue: aDecoder.decodeInt32ForKey("actionType"))
        self.targetKey = aDecoder.decodeObjectForKey("targetKey") as? String
        self.soundType = SoundType(rawValue: aDecoder.decodeInt32ForKey("soundType"))
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeBool(self.isActive, forKey: "isActive")
        if let actionType = self.actionType {
            aCoder.encodeInt(actionType.rawValue, forKey: "actionType")
        }
        if let targetKey = self.targetKey {
            aCoder.encodeObject(targetKey, forKey: "targetKey")
        }
        if let soundType = self.soundType {
            aCoder.encodeInt32(soundType.rawValue, forKey: "soundType")
        }
    }
    
    func prepareSpeaker() {
        guard let
            title = self.title,
            soundType = self.soundType
        else {
            return
        }
        
        var speaker:Speakable?
        
        switch soundType {
        case .Media: break
            
        case .Synthe:
            speaker = AppleSyntheSpeaker()
            try! speaker!.prepare(title)
        }
        
        self.speaker = speaker
    }
    
    func speak() {
        guard let speaker = self.speaker else {
            return
        }
        speaker.speak()
    }
    
    enum ActionType: Int32 {
        case Touch = 1
        case Swipe = 2
        case Key = 3
        
        func getCaption() -> String {
            switch self {
            case .Touch: return "タッチ"
            case .Swipe: return "スワイプ"
            case .Key: return "キー"
            }
        }
        
        static func cases() -> [ActionType] {
            return [.Touch, .Swipe, .Key]
        }
    }
    
    enum SoundType: Int32 {
        case Media = 1
        case Synthe = 2
        
        func getCaption() -> String {
            switch self {
            case .Media: return "音声ファイル"
            case .Synthe: return "合成音声"
            }
        }
        
        static func cases() -> [SoundType] {
            return [.Synthe, .Media]
        }
    }
}