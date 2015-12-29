//
//  MasterViewController.swift
//  Programitty
//
//  Created by Andrew Breckenridge on 12/26/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

import Parse

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects: [Program]? {
        didSet { self.tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objectQuery = PFQuery(className: Program.parseClassName())
        objectQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error != nil {
                print("errorz")
            } else if let objects = objects as? [Program] {
                self.objects = objects
            } else {
                print("fux")
            }
        }
        
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.program = objects![indexPath.row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = objects![indexPath.row].name
        return cell
    }

}

