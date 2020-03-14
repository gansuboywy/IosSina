//
//  BaseViewController.swift
//  Sina
//
//  Created by westking on 2020/03/07.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    // MARK:- lazy attributes
    lazy var visitorView : VisitorView = VisitorView.visitorView()
    
    // MARK:- defiine variables
    var isLogin : Bool = UserAccountUtility.shareInstance.isLogin
    
    // MARK:- overload parent method
    override func loadView() {
        
        isLogin ? super.loadView() : setupVistorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

// MAKE:- set UI
extension BaseViewController {
    // set visitor window
    private func setupVistorView() {
//        visitorView.backgroundColor = UIColor.purple
        view = visitorView
        
        visitorView.signUpBtn.addTarget(self, action: #selector(signUpBtnClick), for: .touchUpInside)
        
        visitorView.signInBtn.addTarget(self, action: #selector(signInBtnClick), for: .touchUpInside)
        
    }
    
    // set navigation item
    private func setupNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Up", style: .plain, target: self, action: #selector(signUpBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(signInBtnClick))
    }
}

// MAKE:- handle event
extension BaseViewController {
    @objc private func signUpBtnClick() {
        print("signUpBtnClick")
    }
    
    @objc private func signInBtnClick() {
        print("signInBtnClick")
        
        // 1. create authorization controller
        let oauthVc = OAuthViewController()
        
        // 2.wrap controller into navigation controller
        let oauthNavi = UINavigationController(rootViewController: oauthVc)
        oauthNavi.modalPresentationStyle = .fullScreen
        
        // 3. popup controller
        present(oauthNavi, animated: true, completion: nil)
        
    }
}


