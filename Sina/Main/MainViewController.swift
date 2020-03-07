//
//  MainViewController.swift
//  Sina
//
//  Created by westking on 2020/03/03.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // MAKE:- attribute
    private lazy var imageNames = ["tabbar_home","tabbar_message_center","","tabbar_discover","tabbar_profile"]
    
    private lazy var composeBtn : UIButton = UIButton.createButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setComposeBtn()
    }
    
    /*
     if you put the following code into viewDidLoad(),
     it will not be shown as expected
     so just add it to viewWillAppear()
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        adjustItem()
    }
}

// MAKE:- set UI
extension MainViewController {
    
    /// set button
    private func setComposeBtn() {
        // 1.add composeBtn button into tabBar
        tabBar.addSubview(composeBtn)
        
        
        /// to simplify processes, move the following into BaseUIButton.swift
        /*
        //2. set attributes
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        composeBtn.sizeToFit()
        */
        
        // 3.set position
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        
        // 4.add action
        /*
         in swift, there are two way to add selector action
         1. Selector("composeBtnClick")
         2. "composeBtnClick"
         */
        composeBtn.addTarget(self, action: Selector("composeBtnClick"), for: .touchUpInside)
//        composeBtn.addTarget(self, action: "composeBtnClick", for: .touchUpInside)
    }
    
    /// adjust items
    private func adjustItem() {
        // 1.travese all item of tabbar
        for i in 0..<tabBar.items!.count {
            // 2.get current item
            let item = tabBar.items![i]
            
            // 3.if i equals to 2, make item to be disable
            if i == 2 {
                item.isEnabled = false
                continue
            }
            
            // 4. set selected-image of other items
            item.selectedImage = UIImage(named: imageNames[i] + "_highlighted")
            
        }
    }
}

// MAKE:- handle event
extension MainViewController {
     @objc private func composeBtnClick()
    {
        print("composeBtnClick")
    }
    
    
}
