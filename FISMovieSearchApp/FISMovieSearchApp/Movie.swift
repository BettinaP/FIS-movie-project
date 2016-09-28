//
//  Movie.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/13/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class Movie {
    
    //    self.title = movieTitle
    //    self.year = year
    //    self.imdbID = movieIMDBid
    //    self.type = validType
    //    self.moviePosterImage = moviePoster
    
    // Created through basic search Dictionary init
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var moviePosterURL: String
    
    // Created in full dictionary
    
    var rated: String = ""
    var released: String = ""
    var runTime: String = ""
    var genre: String = ""
    var director: String = ""
    var writer: String = ""
    var actors: String = ""
    var plot: String = ""
    var language : String = ""
    var awards: String = ""
    var imdbRating: String = ""
    var metaScore: String = ""
    var response: String = ""
    
    init?(basicDictionary: NSDictionary) {//init? makes initializer failable so if not successfully created, then return nil and movie won't be included in search results
 
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
        
        self.title = ""
        self.year = ""
        self.imdbID = ""
        self.type = ""
        self.moviePosterURL = ""
        self.rated = ""
        self.released = ""
        self.runTime = ""
        self.genre = ""
        self.director = ""
        self.writer = ""
        self.actors = ""
        self.plot = ""
        self.language = ""
        self.awards = ""
        self.imdbRating = ""
        self.metaScore = ""
        self.response = ""
        
        
        
    }
    
    
//    func updateMovieWithShortPlot(completion: () -> Void) {
//        
//        OMDBAPIClient.getShortPlotDescriptionFromSearch(imdbID) { dictionary in
//            
//            self.updateMovieWithMoreDetails(dictionary)
//            
//            completion()
//            
//        }
//        
//        
//    }
//    
//    
//    func updateMovieWithFullPlot(completion: () -> Void) {
//        
//        OMDBAPIClient.getFullPlotDescriptionFromSearch(imdbID) { (dictionary) in
//            
//            self.updateMovieWithMoreDetails(dictionary)
//            
//            completion()
//        }
//    
//    }
    
    func updateMovieWithMoreDetails(moreDetailsDictionary: NSDictionary) {
        
        
        rated = moreDetailsDictionary["Rated"] as? String ?? "No Rating"
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