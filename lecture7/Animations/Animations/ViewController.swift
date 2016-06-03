//
//  ViewController.swift
//  Animations
//
//  Created by Chad Zeluff on 5/31/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var redCenterYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveRedView(sender: AnyObject) {
        let newTransform = CGAffineTransformIsIdentity(redView.transform) ? CGAffineTransformMakeTranslation(0, 50) : CGAffineTransformIdentity
        UIView.animateWithDuration(0.5) { 
            self.redView.transform = newTransform
        }
    }
    
    @IBAction func moveWithConstraints(sender: AnyObject) {
        redCenterYConstraint.constant = (redCenterYConstraint.constant == 0) ? 50 : 0
        UIView.animateWithDuration(0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

