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
    private lazy var popupAnimation : PopupAnimation = PopupAnimation{
        [weak self] (presented) -> () in
        self?.titleBtn.isSelected = presented
    }

    // MARK:- method
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.addRotationAnimation()
        
        if !isLogin {
            
        }
        
        setupNavigationBar()
    }
}

// MAKE:- define UI
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

// MAKE:- handle event
extension HomeViewController {
    @objc private func titleBtnClick(titleBtn : TitleButton) {
        // 1. change button status
        titleBtn.isSelected = !titleBtn.isSelected
        
        // 2. create popup controller
        let Vc = PopupViewController()
        
        // 3. when modal window shows, the parent window will keep unchange
        Vc.modalPresentationStyle = .custom
        
        // set transition delegate
        Vc.transitioningDelegate = popupAnimation
       
        popupAnimation.presentedFrame = CGRect(x:  (view.frame.width - 180) / 2, y: 55, width: 180, height: 250)
        // 3.popup controller
        present(Vc, animated: true, completion: nil)
    }
}

