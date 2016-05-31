//
//  RedditAPI.swift
//  JsonTest
//
//  Created by Chad Zeluff on 5/26/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import Foundation

class RedditAPI {
    
    class func getFrontpagePosts(success: (posts: [Post]) -> Void) {
        loadDataFromURL(NSURL(string: "https://reddit.com/.json")!) { (data, error) in
            guard let data = data, let json = parseDataIntoJson(data) else { return }
            
            if let postsJson = json.valueForKeyPath("data.children") as? [JSON] {
                let posts = postsJson.flatMap { Post(json: $0) }
                success(posts: posts)
            }
        }
    }
    
    private class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let loadDataTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.czeluff", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    NSOperationQueue.mainQueue().addOperationWithBlock {
                        completion(data: nil, error: statusError)
                    }
                } else {
                    NSOperationQueue.mainQueue().addOperationWithBlock {
                        completion(data: data, error: nil)
                    }
                }
            }
        }
        
        loadDataTask.resume()
    }
    
    private class func parseDataIntoJson(data: NSData) -> [String: AnyObject]? {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
            return json
        } catch {
            print(error)
        }
        
        return nil
    }
    
}