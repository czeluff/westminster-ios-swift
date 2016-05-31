//
//  ViewController.swift
//  Scrolling
//
//  Created by Chad Zeluff on 5/24/16.
//  Copyright © 2016 Chad Zeluff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addScrollView()
        addColorViews()
    }
    
    private func addScrollView() {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.pagingEnabled = true
        self.view.addSubview(sv)
        NSLayoutConstraint.activateConstraints([
            sv.topAnchor.constraintEqualToAnchor(view.topAnchor),
            sv.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            sv.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            sv.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        ])
        scrollView = sv
    }
    
    private func addColorViews() {
        let blueView = createViewWithColor(.blueColor())
        scrollView.addSubview(blueView)
        let yellowView = createViewWithColor(.yellowColor())
        scrollView.addSubview(yellowView)
        
        let redView = createViewWithColor(.redColor())
        scrollView.addSubview(redView)
        let greenView = createViewWithColor(.greenColor())
        scrollView.addSubview(greenView)
        
        NSLayoutConstraint.activateConstraints([
            blueView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor),
            blueView.heightAnchor.constraintEqualToAnchor(scrollView.heightAnchor),
            yellowView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor),
            yellowView.heightAnchor.constraintEqualToAnchor(scrollView.heightAnchor),
            
            redView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor),
            redView.heightAnchor.constraintEqualToAnchor(scrollView.heightAnchor),
            greenView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor),
            greenView.heightAnchor.constraintEqualToAnchor(scrollView.heightAnchor),
            
            blueView.topAnchor.constraintEqualToAnchor(scrollView.topAnchor),
            blueView.leftAnchor.constraintEqualToAnchor(scrollView.leftAnchor),
            yellowView.topAnchor.constraintEqualToAnchor(scrollView.topAnchor),
            yellowView.leftAnchor.constraintEqualToAnchor(blueView.rightAnchor),
            
            scrollView.rightAnchor.constraintEqualToAnchor(yellowView.rightAnchor),
            
            redView.topAnchor.constraintEqualToAnchor(blueView.bottomAnchor),
            redView.leftAnchor.constraintEqualToAnchor(scrollView.leftAnchor),
            greenView.topAnchor.constraintEqualToAnchor(yellowView.bottomAnchor),
            greenView.leftAnchor.constraintEqualToAnchor(redView.rightAnchor),
            
            scrollView.bottomAnchor.constraintEqualToAnchor(redView.bottomAnchor)

        ])
    }
    
    private func createViewWithColor(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

