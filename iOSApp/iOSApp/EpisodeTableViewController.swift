//
//  EpisodeTableViewController.swift
//  PodLab
//
//  Created by Mark Schall on 1/9/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

import UIKit
import PodLabCommoniOS
import AVKit
import AVFoundation

class EpisodeTableViewController: UITableViewController {

    var podcast: Podcast?
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.podcast?.episodes.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("episodeCell") as? UITableViewCell
        
        var episode = self.podcast!.episodes[indexPath.item] as Episode
        
        cell?.textLabel?.text = episode.title
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         var episode = self.podcast!.episodes[self.tableView.indexPathForSelectedRow()!.item] as Episode
        PlayManager.instance.playEpisode( episode )
    }
}
