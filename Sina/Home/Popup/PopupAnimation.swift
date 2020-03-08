//
//  PopupAnimation.swift
//  Sina
//
//  Created by westking on 2020/03/08.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

class PopupAnimation: NSObject {
    
    // MARK:- attribute
    var isPresented : Bool = false
    var presentedFrame : CGRect = CGRect()
    
    var callBack :((_ presented : Bool) -> ())?
    
    override init() {
        
    }
    init(callBack : @escaping (_ presented : Bool) -> ()) {
        self.callBack = callBack
    }
}

// MAKE:- handle transition delegate
extension PopupAnimation : UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {

//        return UIPresentationController(presentedViewController: presented, presenting: presenting)
        let presentation = PresentationControllerEx(presentedViewController: presented, presenting: presenting)
        presentation.presentedFrame = presentedFrame
        return presentation

    }
    // customize popup animation
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        
        callBack!(isPresented)
        return self
    }
    // customize dismiss animation
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        
        callBack!(isPresented)
        return self
    }

}

// MAKE:- customize animation
extension PopupAnimation : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresentedView(transitionContext: transitionContext) : animationForDimissedView(transitionContext: transitionContext)
    }
    
    // customize popup animation
    private func animationForPresentedView(transitionContext: UIViewControllerContextTransitioning) {
        //
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        transitionContext.containerView.addSubview(presentedView)
        
        presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            () -> Void in
            presentedView.transform = CGAffineTransform.identity
        }) { (_) -> Void in
            transitionContext.completeTransition(true)
        }
    }
    
    // customize dismiss animation
    private func animationForDimissedView(transitionContext: UIViewControllerContextTransitioning) {
        let dismissedView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        // execute animation
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            () -> Void in
            // in case of y is equal to 0.0, then animation will disappear quickly,
            // so in order to disappear slowly, change 0.0 to 0.0001
            dismissedView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.00001)
        }, completion: {
            (_) -> Void in
            dismissedView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
    
}

