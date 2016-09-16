//
//  ViewController.swift
//  my-hood
//
//  Created by Nathan Worcester on 9/12/16.
//  Copyright © 2016 Nathan Worcester. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPosts()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: "postsLoaded", object: nil)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCellTableViewCell{
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCellTableViewCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 87.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }

}

