//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Omar Siddiqui on 6/4/16.
//  Copyright © 2016 Omar Siddiqui. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var helpLabelImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var singleMessageView: UIImageView!
    var messageViewOriginalCenter: CGPoint!
    
    
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
        
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began")
        messageViewOriginalCenter = singleMessageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            singleMessageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
            
            print("Gesture is changing")
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
