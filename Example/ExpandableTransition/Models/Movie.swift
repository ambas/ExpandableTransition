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
    var studio : String
    
    init(movieDict : [String : AnyObject]) {
        movieTitle = movieDict["movieTitle"] as! String
        photoPath = movieDict["posterPath"] as! String
        tagline = movieDict["tagline"] as! String
        overview = movieDict["overview"] as! String
        rating = movieDict["rating"] as! Float
        budget = movieDict["budget"] as! String
        director = movieDict["director"] as! String
        studio = movieDict["studio"] as! String
    }
}
