//
//  Person.swift
//  Notifications
//
//  Created by Chad Zeluff on 5/31/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import Foundation

class Person: NSObject {
    
    let name: String
    
    init(name: String) {
        self.name = name
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(shoutName), name: "ShoutNotification", object: nil)
    }
    
    private dynamic func shoutName() {
        print("\(name)")
    }
    
}