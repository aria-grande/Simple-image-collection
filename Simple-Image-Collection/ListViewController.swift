//
//  ListViewController.swift
//  Simple-Image-Collection
//
//  Created by Aree Oh on 1/31/16.
//  Copyright © 2016 Aree Oh. All rights reserved.
//

import UIKit
import SDWebImage

class ListViewController: UITableViewController {

    // MARK: - variables
    private var images:[Image] = []
    private let listCellReuseIdentifier = "ListCell"
    
    @IBOutlet var listView: UITableView!
    

    func handleRefresh(refreshControl: UIRefreshControl) {
        self.listView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func loadData(images: [Image]) {
        self.images = images
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action:"handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            images.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCellReuseIdentifier, forIndexPath: indexPath) as! ListViewCell
        let image = images[indexPath.row]

        cell.listImageView.sd_setImageWithURL(NSURL(string:image.getSrc())!, placeholderImage: UIImage(named: image.getName()))
        cell.listImageTitle.text = image.getName()
        
        return cell
    }
}
