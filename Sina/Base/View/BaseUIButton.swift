//
//  BaseUIButton.swift
//  Sina
//
//  Created by westking on 2020/03/05.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

extension UIButton {
    
    // In swift, the method which is begun with keyword class indicates it is a  class level method
    class func createButton(imageName : String, bgImageName : String) -> UIButton {
        
        // 1. create button
        let btn = UIButton()
        
        // 2.set attributes
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage(named: "_highlighted"), for: .highlighted)
        
        btn.sizeToFit()
        return btn
    }
}
