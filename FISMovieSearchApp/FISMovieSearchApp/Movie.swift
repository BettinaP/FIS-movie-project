//
//  Movie.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/13/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class Movie {
    
    // Created through basic search Dictionary init
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var moviePosterURL: String
    
    // Created in full dictionary
    
    var rated: String = "N/A"
    var released: String = "N/A"
    var runTime: String = "N/A"
    var genre: String = "N/A"
    var director: String = "N/A"
    var writer: String = "N/A"
    var actors: String = "N/A"
    var plot: String = "N/A"
    var language : String = "N/A"
    var awards: String = "N/A"
    var imdbRating: String = "N/A"
    var metaScore: String = "N/A"
    var response: String = "N/A"
    
    //MARK: Walk me through this - Johann
    
    init?(basicDictionary: NSDictionary) {
        guard let
            movieTitle = basicDictionary["Title"] as? String,
            movieIMDBid = basicDictionary["imdbID"] as? String,
            year = basicDictionary["Year"] as? String,
            validType = basicDictionary["Type"] as? String,
            moviePoster = basicDictionary["Poster"] as? String
        
            else {return nil}
           // else {fatalError("Error creating convenience instance of Movie")}
        
        self.title = movieTitle
        self.year = year
        self.imdbID = movieIMDBid
        self.type = validType
        self.moviePosterURL = moviePoster
    }
    
    init(){
        
        self.title = "N/A"
        self.year = "N/A"
        self.imdbID = "N/A"
        self.type = "N/A"
        self.moviePosterURL = "N/A"
        self.rated = "N/A"
        self.released = "N/A"
        self.runTime = "N/A"
        self.genre = "N/A"
        self.director = "N/A"
        self.writer = "N/A"
        self.actors = "N/A"
        self.plot = "N/A"
        self.language = "N/A"
        self.awards = "N/A"
        self.imdbRating = "N/A"
        self.metaScore = "N/A"
        self.response = "N/A"
        
        
        
    }
    
//   TODO: Make Groups for the appropriate classes --I don't understand what this means, what classes, isn't there only one class...?
    
    
    //MARK: Explain - Johann
    
    func updateMovieWithMoreDetails(moreDetailsDictionary: NSDictionary) {
        
        
        rated = moreDetailsDictionary["Rated"] as? String ?? "N/A"
        released = moreDetailsDictionary["Released"] as? String ?? "N/A"
        runTime = moreDetailsDictionary["Runtime"] as? String ?? "N/A"
        genre = moreDetailsDictionary["Genre"] as? String ?? "N/A"
        director = moreDetailsDictionary["Director"] as? String ?? "N/A"
        writer = moreDetailsDictionary["Writer"] as? String ?? "N/A"
        actors = moreDetailsDictionary["Actors"] as? String ?? "N/A"
        plot = moreDetailsDictionary["Plot"] as? String ?? "N/A"
        language = moreDetailsDictionary["Language"] as? String ?? "N/A"
        awards = moreDetailsDictionary["Awards"] as? String ?? "N/A"
        imdbRating = moreDetailsDictionary["imdbRating"]as? String ?? "N/A"
        metaScore = moreDetailsDictionary["Metascore"] as? String ?? "N/A"
        response = moreDetailsDictionary["Response"] as? String ?? "N/A"
        
        
        
    }
    
}