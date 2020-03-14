//
//  OAuthViewController.swift
//  Sina
//
//  Created by westking on 2020/03/11.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var loginUser : LoginUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        // load web
//        webView.loadRequest(URLRequest(url: URL(string: "http://www.baidu.com")!))
        loadSinaSignIn()
    }
}

// MARK:- UI
extension OAuthViewController {
    
    private func setupNavigationBar() {
        
        // set left bar item
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeItemClick))
        
        // set right bar item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Fill", style: .plain, target: self, action: #selector(fillItemClick))
        
        // set title
        title = "Sign In"
    }
    
    private func loadSinaSignIn() {
        // 1. set url
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(APP_KEY)&redirect_uri=\(REDIRECT_URI)&forcelogin=\(FORCE_LOGIN_FALSE)&language=\(LANGUAGE_EN)"
        
        // 2. create URL object
        guard let url = URL(string: urlString) else {
            return
        }
        
        // 3.create URLRequest object
        let request = URLRequest(url: url)
        
        // 4.load request
        webView.loadRequest(request)
        print("loadSinaSignIn finished")
    }
}

// MARK:- event handle
extension OAuthViewController {
    @objc private func closeItemClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func fillItemClick() {
        // 5.get Login user infomation
        loginUser = LoginUserUtility.shareInstance.readUser()
        
        guard let user = loginUser else {
            return
        }
        
        // 1. javascript
        
        let jsCode = "document.getElementById('userId').value='\(user.userId);document.getElementById('passwd').value='\(user.passwd)';"
        
        // 2. run javascript
        webView.stringByEvaluatingJavaScript(from: jsCode)
        
    }
}

// MARK:- web delegate
extension OAuthViewController : UIWebViewDelegate {
    // start loading web view
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    // finished loading web view
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    // web view is failure when loading Sina
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    // whebn web view loads a page, it will execute this method
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        
        // 1.get url from request
        guard let url = request.url else {
            return true
        }
        
        // 2.convert URL to String
        let urlString = url.absoluteString
        
        // 3. check urlString whether keyword code exists or not
        guard urlString.contains("code=") else {
            return true
        }

        // 4. extract keyword code from urlString
        let code = urlString.components(separatedBy: "code=").last!

        // 5. access token
        loadAccessToken(code: code)

        return false
    }
}

// MARK:- request data
extension OAuthViewController {
    
    private func loadAccessToken(code : String) {
        NetworkTools.shareInstance.loadAccessToken(code: code) { (result, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let userInfoDict = result else {
                print("cann't obtain authorized data")
                return
            }
            
            let account = UserAccount(dict: userInfoDict)
            
            //4. save account object
            // 4.1 get
            var documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            var accountPath = (documentPath as NSString).strings(byAppendingPaths: ["account.plist"]).first!
            NSKeyedArchiver.archiveRootObject(account, toFile: accountPath)

            // 5.save user login information
            print("loadaccesstoken")
            
        }
    }
}
