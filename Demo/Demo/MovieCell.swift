//
//  MovieCell.swift
//  Demo
//
//  Created by Ambas Chobsanti on 2/10/15.
//  Copyright (c) 2015 Taskworld. All rights reserved.
//

import UIKit
import ExpandableViewTransition

let MovieCellID = "MovieCell"
let MovieNibName = "MovieCell"

class MovieCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension MovieCell: CESnapShotViewProtocol {
    
    func snapShotForTransition() -> UIView {
        let snapShotCell = UINib(nibName: MovieNibName, bundle: nil).instantiateWithOwner(self, options: nil).first as! MovieCell
        
        return snapShotCell
    }
}
