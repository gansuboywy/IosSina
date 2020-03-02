//
//  MainViewController.swift
//  Sina
//
//  Created by westking on 2020/03/02.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class MainViewControllerByReflection: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(childVcName: "HomeViewController", title: "HOME", imageName: "tabbar_home")
        addChild(childVcName: "DiscoverViewController", title: "Discover", imageName: "tabbar_discover")
        addChild(childVcName: "MessageViewController", title: "Message", imageName: "tabbar_message_center")
        addChild(childVcName: "ProfileViewController", title: "Me", imageName: "tabbar_profile")

    }
    
    // swift supports method's override
    /// <#Description#>
    /// - Parameters:
    ///   - childVcName: <#childVcName description#>
    ///   - title: <#title description#>
    ///   - imageName: <#imageName description#>
    private func addChild(childVcName : String, title : String, imageName : String) {
        
        // get namespace
//        Bundle.main.infoDictionary!["CFBundleExecutable"]
        guard let namespace = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as! String? else {
            return
        }
        let classStringName = namespace + "." + childVcName
        guard let childVcClass = NSClassFromString(classStringName) else {
            print("failed to instantiate a Class by using name of Class")
            return
        }
        
        // convert AnyObject into class of Controller
        guard let childVcType = childVcClass as? UIViewController.Type else
        {
            print("can't obtain appropriate class type")
            return
        }
        
        // create propriate controller class
        let childVc = childVcType.init()
        
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




