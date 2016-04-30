//
//  TriggerSettingDetailViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/27.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class TriggerSettingDetailViewController: UIViewController {
    
    @IBOutlet weak var actionTitleInput: UITextField!

    weak var speakingAction:SpeakingActionSetting?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        if let speakingAction = self.speakingAction {
            actionTitleInput.text = speakingAction.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
