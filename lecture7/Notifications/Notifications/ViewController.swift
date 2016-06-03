//
//  ViewController.swift
//  Notifications
//
//  Created by Chad Zeluff on 5/31/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let people = [Person(name: "Chad"),Person(name: "Makena")]

    override func viewDidLoad() {
        super.viewDidLoad()
        shoutAtPeople()
    }
    
    private func shoutAtPeople() {
        NSNotificationCenter.defaultCenter().postNotificationName("ShoutNotification", object: nil)
    }
}

