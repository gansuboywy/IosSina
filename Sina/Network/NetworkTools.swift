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
