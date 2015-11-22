//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
     var photos = [Photo]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath)
        //let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath)
        let img = UIImageView(frame:CGRectMake(20, 0, 150, 150));
        let photo = photos[indexPath.item]
        loadImageForCell(photo, imageView: img)
        cell.addSubview(img)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photos.count
    }
    
    func didLoadPhotos(photos: [Photo])
    {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
    func loadImageForCell(photo: Photo, imageView: UIImageView)
    {
        let url = NSURL(string: photo.url)
        if let content = NSData(contentsOfURL: url!)
        {
            imageView.image = UIImage(data: content)
        }
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width * 0.46, UIScreen.mainScreen().bounds.size.height * 0.33)
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("photoClicked", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
    
        
        if (segue.identifier == "photoClicked")
        {
            let destinationViewController = segue.destinationViewController as! PhotoViewController
            if let index = collectionView?.indexPathsForSelectedItems()?[0].row
            {
                destinationViewController.photo = photos[index]
            }
            
        }
    }
    
}

