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
    
    var movieResults: [Movie] = []
    var totalSearchResults : Int = 0
    var plotSummary = String()
    var resultPage: Int = 1
    
    
    
    func getSearchResultsByPageWithCompletion(searchedTerm: String, searchPage: Int, completion: (Bool) ->()) {
        
        
        OMDBAPIClient.getSearchResultsByPage(searchedTerm, searchPage: searchPage) { (resultsDictionary) in
            
            guard let totalResults = resultsDictionary["totalResults"] as? String else {return}
            self.totalSearchResults = Int(totalResults)!
            print(self.totalSearchResults)
            
            if self.movieResults.count <= self.totalSearchResults {
                self.resultPage += 1
                
                guard let resultsArray = resultsDictionary["Search"] as? [[String: AnyObject]] else {return}
                
                for dictionary in resultsArray {
                    
                    let result = dictionary
                    
                    if let movie = Movie(basicDictionary: result) {
                        
                        self.movieResults.append(movie)
                        print(self.movieResults.count)
                        
                        for movie in self.movieResults{
                            print(movie.title)
                            print(movie.moviePosterURL)
                        }
                        
                        
                    }
                }
                completion(true)
                
            }
            //            else if self.movieResults.count > self.totalSearchResults {
            //                print(self.totalSearchResults)
            //                print("error case")
            //                self.movieResults.removeAll()
            //            }
        }
    }
    
    
    //use existing movieObject.ID as parameter instead of passing a string so when you're saving in coredata, you're moving movie (movie.imdbID) & its properties (title & year)
    
    func getShortPlotDescriptionFromSearchWithCompletion(searchedMovie: Movie, completion: (Bool)-> ()) {
        
        
        OMDBAPIClient.getShortPlotDescriptionFromSearch(searchedMovie.imdbID) { (moreDetailsDictionary) in
            
            searchedMovie.updateMovieWithMoreDetails(moreDetailsDictionary)
            
            completion(true)
            
            
            
        }
    
    }
    
    
    
    
    func getFullPlotDescriptionFromSearchWithCompletion(searchedMovie: Movie, completion: (Bool) -> ()) {
        
        OMDBAPIClient.getFullPlotDescriptionFromSearch(searchedMovie.imdbID) { (moreDetailsDictionary) in
            
            searchedMovie.updateMovieWithMoreDetails(moreDetailsDictionary)
            print("I'm the movieID in full plot datastore: \(searchedMovie.imdbID)")
            print("I'm in data store getting plot: \(moreDetailsDictionary["Plot"])")
            completion(true)
            print("I'm in data store getting plot 2: \(moreDetailsDictionary["Plot"])")
        }
        
        
        
    }
    
    
}