//
//  NavigationControllerDelegate.swift
//  Taskworld
//
//  Created by Ambas Chobsanti on 2/3/15.
//  Copyright (c) 2015 Ambas. All rights reserved.
//

import UIKit

public class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    let isHideExpandedView: Bool
    
     public init(isHideExpandedView: Bool) {
        self.isHideExpandedView = isHideExpandedView
        
    }
    
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = Transition(isHideExpandedView: self.isHideExpandedView, isPresenting: operation == .Pop)
        
        return transition
    }
}
