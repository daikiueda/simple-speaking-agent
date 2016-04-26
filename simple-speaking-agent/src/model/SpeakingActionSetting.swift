//
//  SpeakingActionSetting.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/24.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation

class SpeakingActionSetting {
    
    var title: String = "みせってい"
    
    var actionType: ACTION_TYPE?
    
    var targetKey: String?
    
    var soundType: SOUND_TYPE?
    
    init(title: String?) {
        if let title = title {
            self.title = title
        }
    }
    
    enum ACTION_TYPE: Int {
        case SWIPE
        case KEY
        
        func getCaption() -> String {
            switch self {
            case .SWIPE: return "スワイプ"
            case .KEY: return "キー"
            }
        }
    }
    
    enum SOUND_TYPE: Int {
        case MEDIA
        case SYNTHE
        
        func getCaption() -> String {
            switch self {
            case .MEDIA: return "音声ファイル"
            case .SYNTHE: return "合成音声"
            }
        }
    }
}