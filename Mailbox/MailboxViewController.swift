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
    
    
    
    // GLobal OriginalCenters for each ImageView
    
    var messageViewOriginalCenter: CGPoint!
    
    var laterViewOriginalCenter: CGPoint!
    var listViewOriginalCenter: CGPoint!
    
    var archiveViewOriginalCenter: CGPoint!
    var deleteViewOriginalCenter: CGPoint!
    
    
    
    // viewDidLoad
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
        
//        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        var adjustment: CGFloat = 0.0
        

    
        
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began")
        
            
            messageViewOriginalCenter = messageImageView.center
            
            laterViewOriginalCenter =  laterImageView.center
            listViewOriginalCenter = listImageView.center
            
            archiveViewOriginalCenter = archiveImageView.center
            deleteViewOriginalCenter = deleteImageView.center
            
            
            print("LaterX \(laterImageView.center.x)")
            print("LOrigX \(laterViewOriginalCenter.x)")
            print("MIVCenter \(messageImageView.center.x)")
            print("adjstment \(adjustment)")
            
            
            laterImageView.alpha = 0.5
            archiveImageView.alpha = 0.5
            
                UIView.animateWithDuration(0.8) {
                self.laterImageView.alpha = 1.0
                self.archiveImageView.alpha = 1.0
                }

            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            //
            if  messageImageView.center.x <= singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x <= 0 && messageImageView.center.x - singleMessageView.center.x > -60
            {
                    
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                
                
                laterImageView.alpha = 1
                listImageView.alpha = 0
                deleteImageView.alpha = 1
                archiveImageView.alpha = 1
                
                
                singleMessageView.backgroundColor = UIColor.grayColor()
             
                
                
                
            } else if (messageImageView.center.x < singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x <= -60 && messageImageView.center.x - singleMessageView.center.x > -260) {
                
                adjustment = 60
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                singleMessageView.backgroundColor = UIColor.yellowColor()
                
                laterImageView.alpha = 1
                listImageView.alpha = 0
                deleteImageView.alpha = 0
                archiveImageView.alpha = 0
                
                laterImageView.center = CGPoint(x: self.laterViewOriginalCenter.x + translation.x + 60, y: self.laterViewOriginalCenter.y)
                
                
                
                
                //laterImageView.frame.origin = CGPoint(x:singleMessageView.frame.width + translation.x, y: self.messageViewOriginalCenter.y)
                
            } else if (messageImageView.center.x < singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x <= -260) {
                
            
                    messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                    singleMessageView.backgroundColor = UIColor.brownColor()
                    
                laterImageView.alpha = 0
                listImageView.alpha = 1
                deleteImageView.alpha = 0
                archiveImageView.alpha = 0
                
                    listImageView.center = CGPoint(x: self.listViewOriginalCenter.x + translation.x + 60, y: self.listViewOriginalCenter.y)
                
                
            } else if (messageImageView.center.x > singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x >= 0 && messageImageView.center.x - singleMessageView.center.x < 60) {
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                singleMessageView.backgroundColor = UIColor.grayColor()
             
    //            laterViewOriginalCenter.x += translation.x
                
                laterImageView.alpha = 0
                listImageView.alpha = 0
                deleteImageView.alpha = 0
                archiveImageView.alpha = 1
 
                
                
            } else if (messageImageView.center.x > singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x >= 60 && messageImageView.center.x - singleMessageView.center.x < 260) {
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                archiveImageView.center = CGPoint(x: self.archiveViewOriginalCenter.x + translation.x - 60, y: self.archiveViewOriginalCenter.y)
                
                
                laterImageView.alpha = 0
                listImageView.alpha = 0
                deleteImageView.alpha = 0
                archiveImageView.alpha = 1
                
                
                singleMessageView.backgroundColor = UIColor.greenColor()
                
            } else if (messageImageView.center.x > singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x >= 260) {
                
                messageImageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
                
                deleteImageView.center = CGPoint(x: self.deleteViewOriginalCenter.x + translation.x - 60, y: self.deleteViewOriginalCenter.y)
                
                singleMessageView.backgroundColor = UIColor.redColor()
                laterImageView.alpha = 0
                listImageView.alpha = 0
                deleteImageView.alpha = 1
                archiveImageView.alpha = 0
                
            }
            /*
            print("LATERCenter \(laterImageView.center.x)")
            print("LorigCenterX \(laterViewOriginalCenter.x)")
            print("transX \(translation.x)")
            print("adjstment \(adjustment)")
            
            print("MIVCenter \(messageImageView.center.x)")
            */

        } else if sender.state == UIGestureRecognizerState.Ended {
            
            //messageImageView.center  = messageViewOriginalCenter
            
            if (messageImageView.center.x <= singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x <= 0 && messageImageView.center.x - singleMessageView.center.x > -60) {
                
                messageImageView.center = messageViewOriginalCenter
                
            } else if (messageImageView.center.x <= singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x <= -60 && messageImageView.center.x - singleMessageView.center.x > -260) {
                if velocity.x < 0 {
                    UIView.animateWithDuration(0.8) {
                        self.messageImageView.frame.origin.x = -320
                        self.laterImageView.frame.origin.x = -30
                    }
                }
                
                
            } else if (messageImageView.center.x > singleMessageView.center.x && messageImageView.center.x - singleMessageView.center.x >= 0 && messageImageView.center.x - singleMessageView.center.x < 60) {
                
                messageImageView.center = messageViewOriginalCenter
                
            }
            
            
            
            
            
            
           // listImageView.center  = listViewOriginalCenter
            archiveImageView.center = archiveViewOriginalCenter
            deleteImageView.center = deleteViewOriginalCenter
           // laterImageView.center = laterViewOriginalCenter
 

            
            print("LATERCenter \(laterImageView.center.x)")
            print("LorigCenterX \(laterViewOriginalCenter.x)")
            print("transX \(translation.x)")
            print("adjstment \(adjustment)")
            
            print("Gesture ended")
            print("*****************************")
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
