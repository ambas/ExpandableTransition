//
//  UIView+CEExtension.swift
//  ExpandableViewTransition
//
//  Created by Ambas Chobsanti on 2/11/15.
//  Copyright (c) 2015 Taskworld. All rights reserved.
//

extension UIView {
    func origin (point : CGPoint){
        frame.origin.x = point.x
        frame.origin.y = point.y
    }
    
    class func expandAnimation(leftUpperPoint: CGPoint, snapShot: UIView, fromViewController: UIViewController, toViewController: UIViewController,completion:() -> ()) {
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            let offsetY = fromViewController.navigationController!.navigationBarHidden ? 0.0 : navigationHeaderAndStatusbarHeight
            snapShot.frame = CGRectMake(0, offsetY, screenWidth, screenHeight)
            (toViewController as? CEDestinationViewControllerProtocol)?.snapShotTransitioning?(snapShot)
            }, completion: {finished in
                if finished {
                    (toViewController as? CEDestinationViewControllerProtocol)?.snapShotDidTransition?(snapShot)
                    toViewController.view.hidden = false
                    completion()
                }
        })
    }
    
    class func foldAnimation(leftUpperPoint: CGPoint, snapShot: UIView, fromViewController: UIViewController, viewToExpand: CESnapShotViewProtocol, completion:() -> ()) {
        UIView.animateWithDuration(0.25, animations: {
            snapShot.frame = CGRectMake(leftUpperPoint.x, leftUpperPoint.y, (viewToExpand as! UIView).frame.width, (viewToExpand as! UIView).frame.height)
            (fromViewController as? CEDestinationViewControllerProtocol)?.snapShotFoldind?(snapShot)
            }, completion:{finished in
                if finished {
                    (fromViewController as? CEDestinationViewControllerProtocol)?.snapShotDidFold?(snapShot)
                    (viewToExpand as! UIView).hidden = false
                    snapShot.removeFromSuperview()
                    completion()
                }
        })
    }
}