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
    var movie : Movie?
    weak var snapShot: UIView?
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var studioLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset.top = 610
        setupView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func setupView() {
        ratingLabel.text = String(stringInterpolationSegment: movie!.rating)
        directorLabel.text = movie?.director
        budgetLabel.text = movie?.budget
        overviewTextView.text = movie?.overview
        studioLabel.text = movie?.studio
    }
}

extension MovieDetail: DestinationViewControllerProtocol {

    func snapShotWillTransition(snapShot: UIView) {
        let cell = snapShot as! MovieCell
        cell.movieTitle.text = movie?.movieTitle
        if let posterPath = movie?.photoPath {
            cell.posterImageView.image = UIImage(named: posterPath)
        }
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
        cell.movieTitle.text = movie?.movieTitle
        if let posterPath = movie?.photoPath {
            cell.posterImageView.image = UIImage(named: posterPath)
        }
        let ss = self.view.snapshotViewAfterScreenUpdates(true)
        var newRect = ss.bounds
        newRect.origin.y = -64
        ss.frame = newRect
        snapShot.addSubview(ss)
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            var newRect = ss.bounds
            newRect.origin.y = 610
            ss.frame = newRect
            }, completion: nil)
        println("will folding")

    }
    
    func snapShotFoldind(snap Shot: UIView) {
        println("folding")
    }
    
    func snapShotDidFold(snapShot: UIView) {
        println("did fold")
    }
}
