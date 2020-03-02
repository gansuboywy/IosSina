//
//  MainViewControllerByJson.swift
//  Sina
//
//  Created by westking on 2020/03/02.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class MainViewControllerByJson: UITabBarController {

        override func viewDidLoad() {
            super.viewDidLoad()

            // 1.get path of json file
            guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings", ofType: "json") else
            {
                print("failed to get path of json file!")
                return
            }
            
            // 2.get content of json file
//            String.init(contentsOfFile: jsonPath)
            guard let jsonData = try? Data.init(contentsOf: URL(fileURLWithPath: jsonPath)) else {
                print("failed to get contents of json file!")
                return
            }
            
            // 3.convert data to array
            guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) else {
                print("failed to convert data to array!")
                return
            }
            guard let dictArray = anyObject as? [[String : AnyObject]] else
            {
                return
            }
            
            // 4.traverse dictionary
            for dict in dictArray {
                // 4.1 obtain appropriate name of controllers
                guard let vcName = dict["vcName"] as? String else {
                    continue
                }
                
                // 4.2 obtain appropriate name of title
                guard let title = dict["title"] as? String else {
                    continue
                }
                
                // 4.3 obtain appropriate name of images
                guard let imageName = dict["imageName"] as? String else {
                    continue
                }
                addChild(childVcName: vcName, title: title, imageName: imageName)
            }
        }
    /*
      there are three ways to handle exception in swift
      Way 1: do ...catch
            example:
            do {
                JsonSerializaion.JsonObject()
            } catch {
                print(error)
            }
      Way2 : try? (Recommend)
            if exception occur, return nil, otherwise return target object
            example:
            guard let anyObject = try? SONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                        else {
                return
            }
     
     Way 3: try!
            tell system that there is not any exception. when real exception occurs, system will halt
            guard let anyObject = try! SONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                        else {
                return
            }
     */
        
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
