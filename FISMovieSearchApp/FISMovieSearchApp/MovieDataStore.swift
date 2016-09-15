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
    var searchedID = String()
    var plotSummary = String()
    var resultPage: Int = 1
    
    func getMovieBasicSearchResultsWithCompletion(completion: () ->()) {
        print(searchedTitle)
        OMDBAPIClient.getMovieBasicSearchResults(searchedTitle, searchPage: resultPage) { (resultsArray) in
            self.movies.removeAll()
            
            for dictionary in resultsArray {
                guard let result = dictionary as? NSDictionary else {fatalError("Object in resultsArray is of non-dictionary type")}
                let movie = Movie(dictionary: result)
                
                print("I am equal to results poster \(movie.moviePosterImage)")
                
                self.movies.append(movie)
                
            }
            completion()
        }
    }
    
//        func getPlotDescripptionFromSearch(completion: () -> ()) {
//            
//            OMDBAPIClient.getPlotDescriptionFromSearch(searchedID, plotType: plotSummary) { (resultDictionary) in
//                for key in resultDictionary.allKeys {
//                    //i don't really know what i'm trying to get here to be honest
//                }
//            }
//            
//            
//            
//        }
        
        
        //coredata goes into datastore file, but only saving favorites
}