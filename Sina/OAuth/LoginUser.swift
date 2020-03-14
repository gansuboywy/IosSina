//
//  LoginUser.swift
//  Sina
//
//  Created by westking on 2020/03/14.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class LoginUser: NSObject, NSCoding  {
        
    // MARK:- attributes
    // Login User Id
    @objc var userId : String?
    // user password
    @objc var passwd : String?
    
    // MARK:- constructor
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(key)
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: ["userId","passwd"]).description
    }
    
    // MARK:-
    
    required init?(coder aDecoder : NSCoder ) {
      userId =  aDecoder.decodeObject(forKey: "userId") as? String
      passwd =  aDecoder.decodeObject(forKey: "passwd") as? String
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(userId, forKey: "userId")
        coder.encode(passwd, forKey: "passwd")

    }
}
