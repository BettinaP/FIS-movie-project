//
//  Movie.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/13/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class Movie {

    var title: String
    var imdbID: String
    var released: String
    var moviePosterImage: String
    var rated: String
    var runTime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language : String
    var awards: String
    var imdbRating: String
    var metaScore: String
   
    var type: String
    var response: String
    
//    var page: String
//    var fullPlotDescription: String
 
    
    init(dictionary: NSDictionary) {
    
        guard let
        movieTitle = dictionary["Title"] as? String,
        movieIMDBid = dictionary["imdbID"] as? String,
        releaseYear = dictionary["Released"] as? String,
        moviePoster = dictionary["Poster"] as? String,
        movieRated = dictionary["Rated"] as? String,
        movieRuntime = dictionary["Runtime"] as? String,
        movieGenre = dictionary["Genre"] as? String,
        movieDirector = dictionary["Director"] as? String,
        movieWriter = dictionary["Writer"] as? String,
        movieActors = dictionary["Actors"] as? String,
        moviePlot = dictionary["Plot"] as? String,
        movieLanguage = dictionary["Language"] as? String,
        movieAwards = dictionary["Awards"] as? String,
        movieIMDBRating = dictionary["imdbRating"]as? String,
        movieMetascore = dictionary["Metascore"] as? String,

        validType = dictionary["Type"] as? String,
        isThereResponse = dictionary["Response"] as? String
        
        else {fatalError("Error creating instance of Movie")}
    
         title = movieTitle
//       htmlURL = htmlAsURL
         imdbID = movieIMDBid
         released = releaseYear
         moviePosterImage = moviePoster
         rated = movieRated
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
         type = validType
         response = isThereResponse
    
  }


}