//
//  Podcast.swift
//  PodSplitter
//
//  Created by Mark Schall on 1/8/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

import Foundation

public class Podcast : NSCoding {
    
    public var url: String
    public var title : String = ""
    public var link : String = ""
    public var podcastDescription : String = ""
    public var episodes : [Episode] = [];
    
    public init(url : String) {
        self.url = url
    }
    
    @objc public required init(coder aDecoder: NSCoder) {
        self.url = aDecoder.decodeObjectForKey("url") as! String
        self.title = aDecoder.decodeObjectForKey("title") as! String
        self.link = aDecoder.decodeObjectForKey("link") as! String
        self.podcastDescription = aDecoder.decodeObjectForKey("description") as! String
        self.episodes = aDecoder.decodeObjectForKey("episodes") as! [Episode]
    }
    
    @objc public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.url, forKey: "url")
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.link, forKey: "link")
        aCoder.encodeObject(self.podcastDescription, forKey: "description")
        aCoder.encodeObject(self.episodes, forKey: "episodes")
    }
    
    public func updateData( xml : String ) {
        var podcast = SWXMLHash.parse(xml);
        
        var channel = podcast["rss"]["channel"]
        
        self.title = channel["title"].element?.text ?? ""
        self.link = channel["link"].element?.text ?? ""
        self.podcastDescription = channel["description"].element?.text ?? ""
        
        self.episodes = channel["item"].all.map { item in Episode( item: item ) }
    }
}
