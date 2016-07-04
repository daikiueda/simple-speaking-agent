//
//  SyntheTalkerApple.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/05/04.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation
import AVFoundation

class AppleSyntheSpeaker: Speakable {
    static let talker = AVSpeechSynthesizer()
    static let voice = AVSpeechSynthesisVoice(language: "ja-JP")
    
    private var utterance: AVSpeechUtterance?
    
    var pitchMultiplier: Float = 1.0 // 0.5 - 2.0
    var rate: Float = 0.5 // 0.0 - 1.0
    
    init() {
        self.load()
    }
    
    func load() {
        self.pitchMultiplier = 1.0
        self.rate = 0.4
    }
    
    func save() {
        
    }
    
    func prepare(string: String?) throws {
        guard let string = string else {
            throw AppleSyntheSpeaker.Error.StringRequired
        }
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AppleSyntheSpeaker.voice
        utterance.pitchMultiplier = self.pitchMultiplier
        utterance.rate = self.rate
        self.utterance = utterance
    }
    
    func speak() {
        guard let utterance = self.utterance else {
            return
        }
        if AppleSyntheSpeaker.talker.speaking {
            return
            // 発生中にspeakUtteranceを呼ぶと例外発生。
            // stopSpeakingAtBoundaryも同様なので、returnするだけで対処
            // AppleSyntheSpeaker.talker.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        }
        AppleSyntheSpeaker.talker.speakUtterance(utterance)
    }
    
    enum Error: ErrorType {
        case StringRequired
    }
}
