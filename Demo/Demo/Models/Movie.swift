//
//  Movie.swift
//  Demo
//
//  Created by Ambas Chobsanti on 8/20/2558 BE.
//  Copyright (c) 2558 Ambas. All rights reserved.
//

import Foundation

struct Movie {
    var movieTitle : String
    var photoPath : String
    var tagline : String
    
    var overview : String
    var rating : Float
    var director : String
    var budget : String
    
    init (movieTitle: String, photoPath: String, tagline: String, overview: String, rating: Float, director: String, budget: String ) {
        self.movieTitle = movieTitle
        self.photoPath = photoPath
        self.tagline = tagline
        self.overview = overview
        self.rating = rating
        self.director = director
        self.budget = budget
    }
}
