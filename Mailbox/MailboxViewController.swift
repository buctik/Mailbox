//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Omar Siddiqui on 6/4/16.
//  Copyright © 2016 Omar Siddiqui. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {

    
    //Scroll View outlet
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    //Scroll View Subview, ImageView outlets
    @IBOutlet weak var helpLabelImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    //MessageView container outlet
    @IBOutlet weak var singleMessageView: UIView!

    //messageImage outlet
    @IBOutlet weak var messageImageView: UIImageView!
    
    // pan left imageView Outlets
    @IBOutlet weak var laterImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    
    // pan right imageView Outlets
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var deleteImageView: UIImageView!
    
    

    
    var messageViewOriginalCenter: CGPoint!
    
    var laterViewOriginalCenter: CGPoint!
    var listViewOriginalCenter: CGPoint!
    
    var archiveViewOriginalCenter: CGPoint!
    var deleteViewOriginalCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
    
        
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began")
        messageViewOriginalCenter = messageImageView.center
            
        
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            if translation.x > 0  {
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                
                singleMessageView.backgroundColor = UIColor.greenColor()
             
                
                
                /*
            } else if translation.x > 259 && translation.x < 260{
                singleMessageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                
                archiveView.backgroundColor = UIColor.yellowColor()
                archiveView.frame.origin = CGPoint(x:singleMessageView.frame.width + translation.x, y: self.messageViewOriginalCenter.y)
                */
            } else if translation.x < 0 {
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                singleMessageView.backgroundColor = UIColor.grayColor()
             
                
                
                /*
                 archiveView.backgroundColor = UIColor.grayColor()
                 archiveView.frame.origin = CGPoint(x:singleMessageView.frame.width + translation.x, y: self.messageViewOriginalCenter.y)
 
                
                
            } else if translation.x > -60 && translation.x < -260{
                singleMessageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                /*
                 archiveView.backgroundColor = UIColor.yellowColor()
                 archiveView.frame.origin = CGPoint(x:singleMessageView.frame.width + translation.x, y: self.messageViewOriginalCenter.y)
                 */  */
            }
            
            
            
            print("\(translation)")
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            print("Gesture ended")
        }
        
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
