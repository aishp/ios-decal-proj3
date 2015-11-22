//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    var likes : Int!
    var url : String!
    var username : String!
    var postDate : NSDate!
    var liked : Bool!
    
    
    init (data: NSDictionary)
    {
        self.username = data.valueForKey("user")?.valueForKey("username") as! String
        self.url = data.valueForKey("images")?.valueForKey("standard_resolution")?.valueForKey("url") as! String
        self.likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        self.liked = false
        let i = data["created_time"] as! String
        postDate = NSDate(timeIntervalSince1970: Double(i)!)
    }
    
};