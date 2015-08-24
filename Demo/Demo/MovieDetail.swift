//
//  MovieDetail.swift
//  Demo
//
//  Created by Ambas Chobsanti on 2/10/15.
//  Copyright (c) 2015 Taskworld. All rights reserved.
//

import UIKit
import ExpandableViewTransition

class MovieDetail: UITableViewController {
    var movieName = ""
    var posterPath = ""
    weak var snapShot: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset.top = 610
        self.navigationItem.title = movieName
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension MovieDetail: DestinationViewControllerProtocol {

    func snapShotWillTransition(snapShot: UIView) {
        let cell = snapShot as! MovieCell
        cell.movieTitle.text = movieName
        cell.posterImageView.image = UIImage(named: posterPath)
        println("will transition")
    }
    
    func snapShotTransitioning(snapShot: UIView) {
        println("transitioning")
    }
    
    func snapShotDidTransition(snapShot: UIView) {
        println("did transition")
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.tableView.contentInset.top = 230
        }, completion: nil)
      
    }
    
    func snapShotWillFold(snapShot: UIView) {
        let cell = snapShot as! MovieCell
        cell.movieTitle.text = movieName
        cell.posterImageView.image = UIImage(named: posterPath)
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.tableView.contentInset.top = 610
            }, completion: nil)
    }
    
    func snapShotFoldind(snap Shot: UIView) {
        println("folding")
    }
    
    func snapShotDidFold(snapShot: UIView) {
        println("did fold")
    }
}
