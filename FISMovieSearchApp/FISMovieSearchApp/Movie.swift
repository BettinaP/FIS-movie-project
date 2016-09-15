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
    var moviePosterImage: String
    
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
    
    //    var page: String
    //    var fullPlotDescription: String
    //write convenience initializer that only takes what it needs
    
    init(fullDictionary: NSDictionary) {
        
        guard let
            movieTitle = fullDictionary["Title"] as? String,
            year = fullDictionary["Year"] as? String,
            movieIMDBid = fullDictionary["imdbID"] as? String,
            validType = fullDictionary["Type"] as? String,
            moviePoster = fullDictionary["Poster"] as? String,
            released = fullDictionary["Released"] as? String,
            movieRated = fullDictionary["Rated"] as? String,
            movieRuntime = fullDictionary["Runtime"] as? String,
            movieGenre = fullDictionary["Genre"] as? String,
            movieDirector = fullDictionary["Director"] as? String,
            movieWriter = fullDictionary["Writer"] as? String,
            movieActors = fullDictionary["Actors"] as? String,
            moviePlot = fullDictionary["Plot"] as? String,
            movieLanguage = fullDictionary["Language"] as? String,
            movieAwards = fullDictionary["Awards"] as? String,
            movieIMDBRating = fullDictionary["imdbRating"]as? String,
            movieMetascore = fullDictionary["Metascore"] as? String,
            isThereResponse = fullDictionary["Response"] as? String
            
            else {fatalError("Error creating instance of Movie")}
        
        title = movieTitle
        self.year = year
        imdbID = movieIMDBid
        type = validType
        moviePosterImage = moviePoster
        rated = movieRated
        self.released = released
        runTime = movieRuntime
        genre = movieGenre
        director = movieDirector
        writer = movieWriter
        actors = movieActors
        plot = moviePlot
        language  = movieLanguage
        awards = movieAwards
        imdbRating = movieIMDBRating
        metaScore = movieMetascore
        response = isThereResponse
        
    }
    
    
    init(basicDictionary: NSDictionary) {
        //        (title: movieTitle, year: year, imdbID: movieIMDBid, type: validType, moviePosterImage: moviePoster)
        guard let
            movieTitle = basicDictionary["Title"] as? String,
            movieIMDBid = basicDictionary["imdbID"] as? String,
            year = basicDictionary["Year"] as? String,
            validType = basicDictionary["Type"] as? String,
            moviePoster = basicDictionary["Poster"] as? String
            
            else {fatalError("Error creating convenience instance of Movie")}
        
        self.title = movieTitle
        self.year = year
        self.imdbID = movieIMDBid
        self.type = validType
        self.moviePosterImage = moviePoster
    }
    
    
    func updateMovieWithShortPlot(completion: () -> Void) {
        
        OMDBAPIClient.getShortPlotDescriptionFromSearch(imdbID) { dictionary in
            
            self.updateMovieWithMoreDetails(dictionary)
            
            completion()
            
        }
        
        
    }
    
    
    func updateMovieWithFullPlot(completion: () -> Void) {
    
    
    }
    
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