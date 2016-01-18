//
//  UrlTableViewController.swift
//  Gymglish
//
//  Created by Ronaël Bajazet on 17/01/2016.
//  Copyright © 2016 Gymglish. All rights reserved.
//

import UIKit

class UrlTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var urls = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urls += ["www.google.com", "www.duckduckgo.com", "www.twitter.com", "www.facebook.com",
            "www.epitech.eu", "www.youtube.com", "www.apple.com"]
        
        // Set ViewCell AutoLayout
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.urls.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UrlTableViewCell", forIndexPath: indexPath) as! UrlTableViewCell
        
        // Configure the cell...
        cell.urlLabel.text = self.urls[indexPath.row]
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let navController = segue.destinationViewController as! UINavigationController
        let urlViewController = navController.topViewController as! UrlViewController
        
        // Pass the selected object to the new view controller.
        if let selectedUrlCell = sender as? UrlTableViewCell {
            let indexPath = tableView.indexPathForCell(selectedUrlCell)!
            let selectedUrl = self.urls[indexPath.row]
            urlViewController.urlText = selectedUrl
        }
    }
    
    @IBAction func signOutUser(sender: UIBarButtonItem) {
        let alertVC = UIAlertController(title: nil, message: NSLocalizedString("Are you sure you want to disconnect ?", comment: "Log out confirmation text"), preferredStyle: .ActionSheet)
        let disconnect = UIAlertAction(title: NSLocalizedString("Sign out", comment: "Log out action text"), style: .Destructive) { (action: UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Log out action text"), style: .Cancel) { (action: UIAlertAction) -> Void in
        }
        alertVC.addAction(disconnect)
        alertVC.addAction(cancel)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
}
