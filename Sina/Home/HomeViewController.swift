//
//  HomeViewController.swift
//  Sina
//
//  Created by westking on 2020/03/02.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    //  MARK:- lazy variables
    private lazy var titleBtn : TitleButton = TitleButton()

    // MARK:- method
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.addRotationAnimation()
        
        if !isLogin {
            
        }
        
        setupNavigationBar()
    }
}

extension HomeViewController {
    private func setupNavigationBar()
    {
        // 1. set left item
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageName: "navigationbar_friendattention")
        
        // 2. set right item
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageName: "navigationbar_pop")
        
        // 3. set title button
        titleBtn.setTitle("Alpha", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
}


extension HomeViewController {
    @objc private func titleBtnClick(titleBtn : TitleButton) {
        titleBtn.isSelected = !titleBtn.isSelected
    }
}
