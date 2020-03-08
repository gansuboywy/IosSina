//
//  VisitorView.swift
//  Sina
//
//  Created by westking on 2020/03/07.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    class func visitorView() -> VisitorView {
        
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
    }
    
    // MARK:- set component attribute
    @IBOutlet weak var rotationView: UIImageView!
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    // MARK:- customize method
    func setupVisitorViewInfo(iconName : String, title : String) {
        
        iconView.image = UIImage(named: iconName)
        tipLabel.text = title
        rotationView.isHidden = true
    }
    
    func addRotationAnimation(){
        
        // 1. create animation
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.set attributes of animation
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = M_PI * 2
        rotationAnimation.repeatCount = MAXFLOAT
        rotationAnimation.duration = 5
        // animation will stop when screen returns back from other screen. so add the attribute below
        rotationAnimation.isRemovedOnCompletion = false
        
        // 3.add animation into layer
        rotationView.layer.add(rotationAnimation, forKey: nil)
    }
}
