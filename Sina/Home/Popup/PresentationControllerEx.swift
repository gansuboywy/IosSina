//
//  PresentationControllerEx.swift
//  Sina
//
//  Created by westking on 2020/03/08.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class PresentationControllerEx: UIPresentationController {
    
    // MAKE:- public attributes
    var presentedFrame : CGRect = CGRect()
    
    // MAKE:- lazy variables
    private lazy var converView : UIView = UIView()
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        // set size of pop window
        presentedView?.frame = presentedFrame
        
        // set mask view
        setupCoverView()
    }
    
}

extension PresentationControllerEx {
    
    private func setupCoverView() {
        // 1.add mask view
//        containerView?.addSubview(converView)
        containerView?.insertSubview(converView, at: 0)
        
        // 2.set mask attributes
        converView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        converView.frame = containerView!.bounds
        
        // 3.add gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(coverViewClick))
        converView.addGestureRecognizer(tapGesture)
    }
}

extension PresentationControllerEx {
    @objc private func coverViewClick() {
        presentedViewController.dismiss(animated: true, completion: nil)
        print("coverViewClick")
    }
}
