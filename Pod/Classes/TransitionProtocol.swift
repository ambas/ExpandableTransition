//
//  TransitionProtocol.swift
//  Taskworld
//
//  Created by Ambas Chobsanti on 2/3/15.
//  Copyright (c) 2015 Ambas. All rights reserved.
//

import UIKit

public protocol BaseViewControllerProtocol {
    
     func transitionCollectionView() -> UICollectionView
    
     func viewToExpand() -> SnapShotViewProtocol
}

public protocol DestinationViewControllerProtocol {
    
    func snapShotWillTransition(snapShot: UIView)
    
    func snapShotTransitioning(snapShot: UIView)
    
    func snapShotDidTransition(snapShot: UIView)

    func snapShotWillFold(snapShot: UIView)
    
    func snapShotFoldind(snapShot: UIView)
    
    func snapShotDidFold(snapShot: UIView)
}

public protocol SnapShotViewProtocol {
    
    func snapShotForTransition() -> UIView
}