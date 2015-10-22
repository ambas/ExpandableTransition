//
//  Transition.swift
//  Taskworld
//
//  Created by Ambas Chobsanti on 2/3/15.
//  Copyright (c) 2015 Ambas. All rights reserved.
//

import UIKit

let screenBounds = UIScreen.mainScreen().bounds
let screenSize   = screenBounds.size
let screenWidth  = screenSize.width
let screenHeight = screenSize.height
let animationDuration = 0.4
let navigationHeight : CGFloat = 44.0
let statubarHeight : CGFloat = 20.0
let navigationHeaderAndStatusbarHeight : CGFloat = navigationHeight + statubarHeight

public class Transition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting: Bool
    let isHideExpandedView: Bool
    
    init(isHideExpandedView: Bool, isPresenting: Bool) {
        self.isPresenting = isPresenting
        self.isHideExpandedView = isHideExpandedView
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationDuration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as UIViewController!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as UIViewController!
        let containerView = transitionContext.containerView()
        if !self.isPresenting {
            expandCard(fromViewController, toViewController: toViewController, containerView: containerView!, completion: {
                transitionContext.completeTransition(true)
            })
        } else {
            hideCard(fromViewController, toViewController: toViewController, containerView: containerView!, completion: {
                transitionContext.completeTransition(true)
            })
        }
    }
    
    public func expandCard(fromViewController: UIViewController, toViewController: UIViewController, containerView: UIView, completion:() -> ()) {
        toViewController.view.hidden = true
        containerView.addSubview(toViewController.view)
        let viewToExpand = (fromViewController as! BaseViewControllerProtocol).viewToExpand()
        let snapShot = viewToExpand.snapShotForTransition()
        containerView.insertSubview(snapShot, belowSubview: toViewController.view)
        let leftUpperPoint = (viewToExpand as! UIView).convertPoint(CGPointZero, toView: nil)
        snapShot.origin(leftUpperPoint)
        
        (toViewController as? DestinationViewControllerProtocol)?.snapShotWillTransition?(snapShot)
        
        UIView.expandAnimation(leftUpperPoint, snapShot: snapShot, fromViewController: fromViewController, toViewController: toViewController, completion: {
            if self.isHideExpandedView {
                snapShot.removeFromSuperview()
            }
            completion()
        })
    }
    
    public func hideCard(fromViewController: UIViewController, toViewController: UIViewController, containerView: UIView, completion:() -> ()) {
        let toView = toViewController.view
        containerView.addSubview(toView)
        let viewToExpand = (toViewController as! BaseViewControllerProtocol).viewToExpand()
        (viewToExpand as! UIView).hidden = true
        let leftUpperPoint = (viewToExpand as! UIView).convertPoint(CGPointZero, toView: nil)
        let offsetY = fromViewController.navigationController!.navigationBarHidden ? 0.0 : navigationHeaderAndStatusbarHeight
        let snapShot = viewToExpand.snapShotForTransition()
        snapShot.origin(CGPoint(x: 0, y: offsetY))
        snapShot.frame.size.height = screenHeight
        containerView.addSubview(snapShot)
        (fromViewController as? DestinationViewControllerProtocol)?.snapShotWillFold?(snapShot)
        
        UIView.foldAnimation(leftUpperPoint, snapShot: snapShot, fromViewController: fromViewController, viewToExpand: viewToExpand, completion: {
            completion()
        })
    }
}