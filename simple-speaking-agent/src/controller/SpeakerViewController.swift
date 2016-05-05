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
    @IBOutlet private dynamic weak var toSettingView: UIBarButtonItem?

    // TODO: やむをえずシングルトン
    private let settingManager = SettingsManager.sharedInstance
    
    private var targetKeyCommands: [UIKeyCommand]?
    
    // キー入力（Bluetoothデバイス）を受け取るため
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navBar = navBar {
            navBar.delegate = self
        }
        
        // スイッチコントロール利用をふまえて、メイン部分以外はハイライト対象から除外
        if let toSettingView = toSettingView {
            toSettingView.isAccessibilityElement = false
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.enableActionCaptureForSpeaking()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // 表示調整
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
    func enableActionCaptureForSpeaking() {
        if let actionInterface = actionInterface {
            actionInterface.userInteractionEnabled = true
        }
        
        if let targetKeyCommands = self.targetKeyCommands {
            for keyCommand in targetKeyCommands {
                self.removeKeyCommand(keyCommand)
            }
        }
        
        self.targetKeyCommands = self.settingManager.getTargetKeyCommands(#selector(handleKeyPressed))
        for keyCommand in self.targetKeyCommands! {
            self.addKeyCommand(keyCommand)
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
    
    func handleKeyPressed(keyCommand: UIKeyCommand) {
        print(keyCommand.input)
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
