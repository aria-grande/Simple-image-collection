//
//  ImageCollectionViewController.swift
//  Simple-Image-Collection
//
//  Created by Aree Oh on 1/29/16.
//  Copyright © 2016 Aree Oh. All rights reserved.
//

import UIKit

class GridViewController: UICollectionViewController {

    // MARK: - variables and struct
    @IBOutlet var gridView: UICollectionView!
    
    private let gridCellReuseIdentifier = "GridCell"
    private var images:[Image] = []
    
    
    // MARK: - life cycle
    func loadData(images:[Image]) {
        self.images = images
        self.gridView?.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(gridCellReuseIdentifier, forIndexPath: indexPath) as! GridViewCell
        
        let image = images[indexPath.row]

        cell.gridImageView.image = UIImage(data: image.getImageData())
        cell.gridImageTitle.text = image.getName()
        
        return cell
    }
}