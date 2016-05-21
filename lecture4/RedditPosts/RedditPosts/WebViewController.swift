//
//  WebViewController.swift
//  RedditPosts
//
//  Created by Chad Zeluff on 5/19/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var url: NSURL?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let url = url {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }
    
    
}
