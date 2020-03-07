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
    var isLogin : Bool = false
    
    // MARK:- overload parent method
    override func loadView() {
        isLogin ? super.loadView() : setupVistorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension BaseViewController {
    private func setupVistorView() {
//        visitorView.backgroundColor = UIColor.purple
        view = visitorView
    }
}
