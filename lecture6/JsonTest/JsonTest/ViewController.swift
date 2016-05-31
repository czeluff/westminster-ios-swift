//
//  ViewController.swift
//  JsonTest
//
//  Created by Chad Zeluff on 5/19/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
    }
    
    func fetchPosts() {
        RedditAPI.getFrontpagePosts { posts in
            self.posts = posts
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCellIdentifier", forIndexPath: indexPath)
        
        cell.textLabel?.text = posts[indexPath.row].title
        
        return cell
    }
}

