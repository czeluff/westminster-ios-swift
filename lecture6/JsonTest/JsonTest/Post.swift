//
//  Post.swift
//  JsonTest
//
//  Created by Chad Zeluff on 5/19/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let title: String
    let url: NSURL
    
    init?(json: JSON) {
        guard let title: String = "data.title" <~~ json else { return nil }
        guard let url: NSURL = "data.url" <~~ json else { return nil }
        self.title = title
        self.url = url
    }
}