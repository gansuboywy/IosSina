//
//  UserAccountUtility.swift
//  Sina
//
//  Created by westking on 2020/03/12.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class UserAccountUtility {
    // MARK:- singleton
    static let shareInstance : UserAccountUtility = UserAccountUtility()
    
    // MARK:- local variables
    var userAccount : UserAccount?
    
    // MARK:- computed attribute
    var accountPath : String {
        // read archiver from sandbox
        // get path of sandbox
        var documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        print(documentPath)
        return (documentPath as NSString).strings(byAppendingPaths: ["account.plist"]).first!
    }
    
    var isLogin : Bool {
        if self.userAccount == nil {
            return false
        }

        guard let expiresDate = userAccount?.expires_date else {
            return false
        }

        return expiresDate.compare(Date()) == ComparisonResult.orderedDescending
    }
    
    // MARK:- initial method
    init() {
        // get user account from sandbox
        userAccount = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
    }

}
