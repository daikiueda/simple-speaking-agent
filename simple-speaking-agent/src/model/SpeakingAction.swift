//
//  SpeakingActionSetting.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/24.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation

class SpeakingAction {
    
    var title: String = "みせってい"
    
    var isActive: Bool = false
    
    var actionType: ActionType?
    
    var targetKey: String?
    
    var soundType: SoundType?
    
    init(title: String?) {
        if let title = title {
            self.title = title
        }
    }
    
    enum ActionType: Int {
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
    
    enum SoundType: Int {
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