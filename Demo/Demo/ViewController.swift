//
//  ViewController.swift
//  Demo
//
//  Created by Ambas Chobsanti on 2/10/15.
//  Copyright (c) 2015 Taskworld. All rights reserved.
//

import UIKit
import ExpandableViewTransition

class ViewController: UICollectionViewController {
    
    let holder = CENavigationControllerDelegate(isHideExpandedView: false)
    var indexPathSelected: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = holder
        registerNibForCollectionView()
        configureLayout()
    }
    
    func registerNibForCollectionView() {
        let movieCell = UINib(nibName: MovieNibName, bundle: nil)
        self.collectionView?.registerNib(movieCell, forCellWithReuseIdentifier: MovieCellID)
    }
    
    func configureLayout() {
        let flowLayout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let screenWidth = flowLayout.collectionView!.bounds.size.width
        flowLayout.itemSize = CGSize(width: flowLayout.collectionView!.bounds.size.width, height: 154)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let movieDetailViewController = segue.destinationViewController as! MovieDetail
      movieDetailViewController.movieName = "Imitation Game"
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(MovieCellID, forIndexPath: indexPath) as! MovieCell
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.indexPathSelected = indexPath
        self.performSegueWithIdentifier("movieDetail", sender: self)
    }
}

extension ViewController: CEBaseViewControllerProtocol {
    
    func transitionCollectionView() -> UICollectionView {
        return self.collectionView!
    }
    
    func viewToExpand() -> CESnapShotViewProtocol {
        var cell = self.collectionView?.cellForItemAtIndexPath(self.indexPathSelected!) as! MovieCell
        
        return cell
    }
}