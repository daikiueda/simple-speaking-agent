//
//  TriggerSettingViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/24.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class TriggerSettingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var actionListTable: UITableView!
    
    var settingsManager: SettingsManager!
    
    var selectedAction: SpeakingActionSetting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionListTable.delegate = self
        self.settingsManager = SettingsManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsManager.getSpeakingActions().count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionItem", forIndexPath: indexPath)
        let actionTitle = self.settingsManager?.getSpeakingActions()[indexPath.row].title
        cell.textLabel!.text = actionTitle
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedAction = self.settingsManager.getSpeakingActions()[indexPath.row]
        if self.selectedAction != nil {
            performSegueWithIdentifier("toEditActionItem", sender: nil)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toEditActionItem" {
            let dest = segue.destinationViewController as! TriggerSettingDetailViewController
            dest.speakingAction = self.selectedAction
        }
    }
    
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }
}
