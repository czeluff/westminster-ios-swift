//
//  PostsTableViewController.swift
//  RedditPosts
//
//  Created by Chad Zeluff on 5/19/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFakeData()
    }
    
    private func loadFakeData() {
        posts = [
            Post(title: "Chad 1", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 2", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 3", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 4", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 5", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 6", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 7", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 8", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 9", url: NSURL(string: "https://www.google.com")!),
            Post(title: "Chad 10", url: NSURL(string: "https://www.google.com")!)
        ]
    }
    
    @IBAction func refresh(sender: AnyObject) {
        posts = [Post(title: "Hooray", url: NSURL(string: "https://www.google.com")!)]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let url = posts[row].url
            let vc = segue.destinationViewController as! WebViewController
            vc.url = url
        }
    }
}

