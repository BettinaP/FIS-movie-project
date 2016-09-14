//
//  MovieDataStore.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/13/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation


class MovieDataStore {

   static let sharedInstance = MovieDataStore()
   private init() {}
    
   var movies: [Movie] = []
   var searchedTitle = String()
   var resultPage = String()
    
   func getMovieBasicSearchResultsWithCompletion(completion: () ->()) {
    
        OMDBAPIClient.getMovieBasicSearchResults(searchedTitle, searchPage: resultPage) { (resultsArray) in
            self.movies.removeAll()
            
            for dictionary in resultsArray {
                guard let result = dictionary as? NSDictionary else {fatalError("Object in resultsArray is of non-dictionary type")}
                let poster = result["Poster"] as! String
                let imdbID = result["imdbID"] as! String
                let title = result["Title"] as! String
                let year = result["Year"] as! String
                let movie = Movie(dictionary: result)

                self.movies.append(movie)
            }
            
    }
   }
    
    

}