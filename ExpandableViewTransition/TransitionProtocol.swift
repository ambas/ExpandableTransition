//
//  TransitionProtocol.swift
//  Taskworld
//
//  Created by Ambas Chobsanti on 2/3/15.
//  Copyright (c) 2015 Ambas. All rights reserved.
//

import UIKit

@objc public protocol BaseViewControllerProtocol {
    
     func transitionCollectionView() -> UICollectionView
    
     func viewToExpand() -> SnapShotViewProtocol
}

@objc public protocol DestinationViewControllerProtocol {
    
    optional func snapShotWillTransition(snapShot: UIView)
    
    optional func snapShotTransitioning(snapShot: UIView)
    
    optional func snapShotDidTransition(snapShot: UIView)

    optional func snapShotWillFold(snapShot: UIView)
    
    optional func snapShotFoldind(snapShot: UIView)
    
    optional func snapShotDidFold(snapShot: UIView)
}

@objc public protocol SnapShotViewProtocol {
    
    func snapShotForTransition() -> UIView
}