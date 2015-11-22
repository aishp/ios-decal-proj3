//
//  PhotoViewController.swift
//  Photos
//
//  Created by Aishwarya on 11/21/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var UserNameText: UILabel!
    
    @IBOutlet weak var PostDateText: UILabel!
   
    @IBOutlet weak var LikesText: UILabel!
    

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    var photo: Photo!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        UserNameText.text = photo.username
        LikesText.text = "❤️" + String(photo.likes)
        PostDateText.text = String(photo.postDate)
        
        let url = NSURL(string: photo!.url)
        if let img = NSData(contentsOfURL: url!) {
            imageDisplay.image = UIImage(data:img)
            imageDisplay.frame = CGRectMake(
                imageDisplay.frame.origin.x,
                imageDisplay.frame.origin.y, UIScreen.mainScreen().bounds.size.width * 0.46, UIScreen.mainScreen().bounds.size.height * 0.46);
            
            //imageDisplay.contentMode = UIViewContentModeBottomLeft;
        }
        
    }
    
    
    @IBAction func toLike(sender: AnyObject)
    {
        //likeButton.setTitle("❤️", forState: UIControlState.Normal)
        likeButton.setTitle("❤️", forState: UIControlState.Normal)
        if photo.liked == false
        {
            LikesText.text = "❤️" + String(photo.likes+1)
        }
        photo.liked = true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
