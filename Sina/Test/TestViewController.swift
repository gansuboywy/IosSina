//
//  TestViewController.swift
//  Sina
//
//  Created by westking on 2020/03/09.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        NetworkTools.shareInstance.request(methodType: RequestType.GET, urlString: "http://httpbin.org/get", parameters: ["name" : "alpha", "age" : 20])
        
        NetworkTools.shareInstance.request(methodType: RequestType.POST ,urlString: "http://httpbin.org/post", parameters: ["name" : "alpha", "age" : 20]) { (result, error) -> () in
            if error != nil {
                print(error)
            }
            print(result)
        }
    }

}
