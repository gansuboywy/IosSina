//
//  BaseUIBarButtonItem.swift
//  Sina
//
//  Created by westking on 2020/03/08.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// the first way
    /*
    convenience init(imageName : String) {
        self.init()
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        
        self.customView = btn
    }
     */
    
    /// the second way 
    convenience init(imageName : String) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        
        self.init(customView : btn)
    }
}
