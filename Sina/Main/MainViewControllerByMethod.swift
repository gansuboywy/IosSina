//
//  MainViewControllerByMethod.swift
//  Sina
//
//  Created by westking on 2020/03/02.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class MainViewControllerByMethod: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(childVc: HomeViewController(), title: "HOME", imageName: "tabbar_home")
        addChild(childVc: DiscoverViewController(), title: "Discover", imageName: "tabbar_discover")
        addChild(childVc: MessageViewController(), title: "Message", imageName: "tabbar_message_center")
        addChild(childVc: ProfileViewController(), title: "Me", imageName: "tabbar_profile")

    }
    
    // swift supports method's override
    private func addChild(childVc : UIViewController, title : String, imageName : String) {
        
        // 1.set attribues of child controller
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_home_highlighted")
        
        // 2.add child controller into navigator controller
        let childNavi = UINavigationController(rootViewController: childVc)
        
        // 3.add navigation controller into main view controller
        addChild(childNavi)
    }


}
