//
//  NetworkTools.swift
//  Sina
//
//  Created by westking on 2020/03/09.
//  Copyright © 2020 westking. All rights reserved.
//

import AFNetworking

// MARK:- define
enum RequestType : Int {
    case GET = 0
    case POST = 1
}

class NetworkTools: AFHTTPSessionManager {
    // thread-safe(singleton)
    static var shareInstance : NetworkTools {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }
}

// MARK:- encapsulate request method
extension NetworkTools {
    
    func request(methodType : RequestType, urlString : String, parameters : [String : Any], finished : @escaping (_ result : Any?,_ error : Error?) -> ()) {
        
        // 1. define success callback
        let successCallback = { (task : URLSessionDataTask, result : Any) in
                finished(result, nil)
        }
        
        // 2. define failure callback
        let failureCallback = {
            (task : URLSessionDataTask?, error : Error) in
            finished(nil, error)
        }
        if methodType == .GET {
            get(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback )
        }
        if methodType == .POST {
            post(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback )
        }
    }
}

// MARK:- request data
extension NetworkTools {
    func loadAccessToken(code : String, finished : @escaping (_ result : [String : Any]?, _ error : Error?) -> ())  {
        
        // 1.
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        // 2.
        let parameters = ["client_id" : APP_KEY, "client_secret" : APP_SECRET, "grant_type" : "authorization_code",  "redirect_uri" : REDIRECT_URI, "code" : code]
        
        // 3. sent request
        request(methodType: .POST, urlString: urlString, parameters: parameters) { (result, error) in
            finished(result as! [String : Any], error)
        }
        
    }
}
