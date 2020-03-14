//
//  LoginUserUtility.swift
//  Sina
//
//  Created by westking on 2020/03/14.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class LoginUserUtility {
    // MARK:- singleton
    static let shareInstance : LoginUserUtility = LoginUserUtility()
    
    
    // MARK:- computed attribute
    var accountPath : String {
        // read archiver from sandbox
        // get path of sandbox
        var documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (documentPath as NSString).strings(byAppendingPaths: ["user.plist"]).first!
    }

    func readUser() -> LoginUser? {
        // get user account from sandbox
        return NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? LoginUser
    }
    
    func writeUser(loginUser : LoginUser) {
        NSKeyedArchiver.archiveRootObject(loginUser, toFile: accountPath)

    }
    
    
}
