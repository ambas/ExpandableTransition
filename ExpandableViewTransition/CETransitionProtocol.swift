//
//  CETransitionProtocol.swift
//  Taskworld
//
//  Created by Ambas Chobsanti on 2/3/15.
//  Copyright (c) 2015 Taskworld. All rights reserved.
//

import UIKit

@objc public protocol CEBaseViewControllerProtocol {
    
     func transitionCollectionView() -> UICollectionView
    
     func viewToExpand() -> CESnapShotViewProtocol
}

@objc public protocol CEDestinationViewControllerProtocol {
    
    optional func snapShotWillTransition(snapShot: UIView)
    
    optional func snapShotTransitioning(snapShot: UIView)
    
    optional func snapShotDidTransition(snapShot: UIView)

    optional func snapShotWillFold(snapShot: UIView)
    
    optional func snapShotFoldind(snapShot: UIView)
    
    optional func snapShotDidFold(snapShot: UIView)
}

@objc public protocol CESnapShotViewProtocol {
    
    func snapShotForTransition() -> UIView
}