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
    
    let holder = NavigationControllerDelegate(isHideExpandedView: false)
    var indexPathSelected: NSIndexPath?
    let dataSource = PlistReader(fileName: "MovieDB").arrayFromFile()
    
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
        flowLayout.itemSize = CGSize(width: flowLayout.collectionView!.bounds.size.width, height: 165)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cellSelected = sender as! MovieCell
        let indexPath = collectionView?.indexPathForCell(cellSelected)
        let movie = self.dataSource[indexPath!.row] as! [String : AnyObject]
        let movieDetailViewController = segue.destinationViewController as! MovieDetail
        movieDetailViewController.movie = Movie(movieDict: movie)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(MovieCellID, forIndexPath: indexPath) as! MovieCell
        let movieDict = dataSource[indexPath.row] as! [String: AnyObject]
        let movieTitle = movieDict["movieTitle"] as! String
        let posterPath = movieDict["posterPath"] as! String
        cell.movieTitle.text = movieTitle
        cell.posterImageView.image = UIImage(named: posterPath)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.indexPathSelected = indexPath
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        self.performSegueWithIdentifier("movieDetail", sender: cell)
    }
}

extension ViewController: BaseViewControllerProtocol {
    
    func transitionCollectionView() -> UICollectionView {
        return self.collectionView!
    }
    
    func viewToExpand() -> SnapShotViewProtocol {
        var cell = self.collectionView?.cellForItemAtIndexPath(self.indexPathSelected!) as! MovieCell
        
        return cell
    }
}