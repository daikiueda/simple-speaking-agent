//
//  TriggerSettingViewController.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/04/24.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import UIKit

class TriggerSettingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private dynamic weak var actionListTable: UITableView?
    
    var settingsManager: SettingsManager?
    
    private var selectedAction: SpeakingAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let actionListTable = actionListTable {
            actionListTable.delegate = self
        }
        
        // TODO: やむをえずシングルトン
        self.settingsManager = SettingsManager.sharedInstance
    }

    override func viewWillAppear(animated: Bool) {
        if let actionListTable = actionListTable {
            actionListTable.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let settingsManager = self.settingsManager else {
            return 0
        }
        return settingsManager.getSpeakingActions().count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionItem", forIndexPath: indexPath)
        let actionTitle = self.settingsManager?.getSpeakingActions()[indexPath.row].title
        cell.textLabel!.text = actionTitle
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let settingsManager = self.settingsManager else {
            return
        }
        
        self.selectedAction = settingsManager.getSpeakingActions()[indexPath.row]
        if self.selectedAction != nil {
            performSegueWithIdentifier("toEditActionItem", sender: nil)
        }
    }
    
    func updateSpeakingAction(speakingAction: SpeakingAction) {
        guard let settingsManager = self.settingsManager else {
            return
        }
        
        settingsManager.registorSpeakingAction(speakingAction)
    }
    
    
    // MARK: - Navigation
    
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toEditActionItem" {
            let dest = segue.destinationViewController as! TriggerSettingDetailViewController
            dest.speakingAction = self.selectedAction
        }
        
        if segue.identifier == "toEditNewActionItem" {
            let dest = segue.destinationViewController as! TriggerSettingDetailViewController
            dest.speakingAction = SpeakingAction(title: "しょきち")
        }
    }
}
