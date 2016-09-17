//
//  MovieDataStore.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/13/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation


class MovieDataStore {
    
    static let sharedInstance = MovieDataStore() // allows us to have one instance of datastore
    private init() {} //make sure people aren't trying to create multiple instances of the singleton (esp since purpose of singleton is to initalized one time only and be passed around)
    
    var movieResults: [Movie] = []
//    var searchedTitle = String()
   // var searchedID = String()
    var plotSummary = String()
   // var resultPage: Int = 1
    
    func getMovieBasicSearchResultsWithCompletion(searchedTitle: String, completion: (Bool) ->()) {
        
        print(searchedTitle)
        
    //    OMDBAPIClient.getMovieBasicSearchResults(searchedTitle, searchPage: resultPage) { (resultsArray) in
        
        /* to do:
        1) get array of results form json,
        2) loop over array to create movie objects,
        3) add movie objects to datastore array
        4) use completion handler to inform collection view that array of movies is ready
        */
        OMDBAPIClient.getMovieBasicSearchResults(searchedTitle) { (resultsArray) in
            
            self.movieResults.removeAll()
            
            for dictionary in resultsArray {
                
               let result = dictionary
//                as? NSDictionary else {fatalError("Object in resultsArray is of non-dictionary type")}
                
                if let movie = Movie(basicDictionary: result) { //that way if movie returns as nil from search, won't be added to movies array
                
                print("I am equal to results poster \(movie.moviePosterImage)")
                
                self.movieResults.append(movie)
                }
            }
            completion(true)
        }
    }
    
    
    //use existing movieObject.ID as parameter instead of passing a string
//    so when you're saving in coredata, you're moving movie & its properties (title & year) 
    
    func getShortPlotDescriptionFromSearchWithCompletion(movie: Movie, completion: (Bool)-> ()) {
    
    
        OMDBAPIClient.getShortPlotDescriptionFromSearch(movie.imdbID) { (shortPlotResult) in
           // TO DO: additional details to dipsplau
//            let shortPlotMovie = Movie(fullDictionary: shortPlotResult)
//            shortPlotMovie.plot = shortPlotResult["Plot"] as! String
//            print("i am equal to the short plot : \(shortPlotMovie.plot)")
            //i don't really know what i'm trying to get here to be honest
            
            //if movieID is true/right ID, update my labels or pass the plot info
           completion(true)
        }
       //pagination, compare movie array count to total resuls count, if not don't make that api call, check response
    
    }
    
    
    
    
//        func getFullPlotDescriptionFromSearch(searchedID, completion: () -> ()) {
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
        
    
}

//

//coredata goes into datastore file, but only saving favorites with poster image of facor

//write func that gets detailed info with an api call that takes a ID string  & compeltion block as parameter, call it and pass it movie object you're on.


//movies duplicating because during pagination, instead of turning the page and thenr eading the api. must turn the page first then read subsequent pages
//core data issues- slapchat relationships for saving favorite movies, movie object is the message, favorites is the recipient
// pass movie object from VC to VC ie. movie.ID
//when done with MVP, create an additional unique feature (ie. home page populated with fandago api of current movies, animating background)