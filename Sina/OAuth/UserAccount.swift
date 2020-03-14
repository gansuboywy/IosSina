//
//  UserAccount.swift
//  Sina
//
//  Created by westking on 2020/03/11.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class UserAccount: NSObject, NSCoding {
    
    // MARK:- attributes
    var isRealName : Bool = false
    @objc var access_token : String? = ""
    @objc var expires_in : TimeInterval = 0.0 {
        didSet{
            expires_date = Date(timeIntervalSinceNow: expires_in)
        }
    }
    @objc var uid : String? = ""
    @objc var remind_in : String = ""
    @objc var expires_date : Date?
    // nick name
    @objc var screen_name : String?
    // user head icon
    @objc var avatar_large : String?
    
    // MARK:- constructor
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(key)
    }
    
    override var description: String {
//        return """
//            access_token=\(access_token)
//            expires_date=\(expires_date)
//            expires_in=\(expires_in)
//            """
        return dictionaryWithValues(forKeys: ["access_token","expires_date","uid"]).description
    }
    
    // MARK:-
    
    required init?(coder aDecoder : NSCoder ) {
      access_token =  aDecoder.decodeObject(forKey: "access_token") as? String
      uid =  aDecoder.decodeObject(forKey: "uid") as? String
      expires_date =  aDecoder.decodeObject(forKey: "expires_date") as? Date
      screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
      avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(access_token, forKey: "access_token")
        coder.encode(uid, forKey: "uid")
        coder.encode(expires_date, forKey: "expires_date")
        coder.encode(screen_name, forKey: "screen_name")
        coder.encode(avatar_large, forKey: "avatar_large")
    }
}
