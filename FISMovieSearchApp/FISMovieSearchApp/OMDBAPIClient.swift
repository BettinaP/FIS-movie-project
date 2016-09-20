//
//  OMDBAPIClient.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/12/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class OMDBAPIClient {
    
    //by title
    
    // http://www.omdbapi.com/?t=Batman&y=&plot=short&r=json
    // http://www.omdbapi.com/?t=batman&y=&plot=full&r=json
    
    // Search pagination added: http://www.omdbapi.com/?s=Batman&page=2
    // You can now return all episodes by using just the "Season" parameter: http://www.omdbapi.com/?t=Game of Thrones&Season=1
    //Response = True;
    /*Search =     (
     {
     Poster = "http://ia.media-imdb.com/images/M/MV5BNTM3OTc0MzM2OV5BMl5BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg";
     Title = "Batman Begins";
     Type = movie;
     Year = 2005;
     imdbID = tt0372784;
     }
     */
    
    //by id http://www.omdbapi.com/?i=tt0097757&plot=short&r=json
    
    
    class func getMovieBasicSearchResults(searchTerm: String, completion:[String : AnyObject] -> ()) {
    
        // make network call, get back some data and pass it back to data store ( not parsing through dictionary of data in this method. Just getting it and passing it to datastore)
        //    class func getMovieBasicSearchResults(searchTitle: String, searchPage: Int, completion:[[String: AnyObject]] -> ()) {
        
        // if searchBar.text = "", then arcRandom from defaultSearchTerm array, else take in searchBar.text as argument
        
        // also replace spaces in searchterm with plus
        
        let spacelessSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        let searchPage = 1
        let urlString = "https://www.omdbapi.com/?s=\(spacelessSearchTerm)&page=\(searchPage)"
        print(urlString)
        let searchURL = NSURL(string: urlString)
        print(searchURL)
        
        let searchSession = NSURLSession.sharedSession()
        //let searchSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        guard let unwrappedSearchURL = searchURL else {fatalError("Invalid URL")}
        
        
        searchSession.dataTaskWithURL(unwrappedSearchURL) { (data, response, error) in
            
            guard let searchData = data else {fatalError("Unable to get data \(error?.localizedDescription)")}
            
            do {
                let basicSearchDictionary = try NSJSONSerialization.JSONObjectWithData(searchData, options: []) as! [String : AnyObject] //array of dictionaries
                print(basicSearchDictionary)
                //  print("Im printing basic search array \(basicSearchArray)")
                guard let unwrappedBasicSearchDictionary = basicSearchDictionary as? [String : AnyObject] else {return}
                //print("This is wrong \(unwrappedBasicSearchDictionary)")
//                guard let basicSearchArray = basicSearchDictionary["Search"] as? [[String:AnyObject]] else {return}
//                                print(basicSearchArray)
//   
                completion(unwrappedBasicSearchDictionary)
                
                //pass back whole dictionary so can also access "total results" key, not just "search" so can do pagination 
                
            } catch {
                
                print("this is the first \(error)")
            }
            
            
            }.resume()
        
    }
    
    
    
    
    //by id http://www.omdbapi.com/?i=tt0097757&plot=short&r=json
    
    //class func getPlotDescriptionFromSearch(movieID: String, plotType: String, completion: (NSDictionary) ->()){
    
    //   let descriptionURLString = "https://www.omdbapi.com/?i=\(movieID)&plot=\(plotType)&r=json"
    
//    class func getShortPlotDescriptionFromSearch(movie: Movie, completion:(NSDictionary) ->()) {
    
        class func getShortPlotDescriptionFromSearch(movieID: String, completion:(NSDictionary) ->()) {
        //WON'T LET ME PASS IN MOVIE.MOVIEID INSTEAD STRING for movieID
        
//        let movieID = movie.imdbID
        let shortURLString = "https://www.omdbapi.com/?i=\(movieID)&plot=short&r=json"
        let shortURL = NSURL(string: shortURLString)
        guard let unwrappedShortURL = shortURL else {fatalError("Invalid URL")}
        let descriptionSession = NSURLSession.sharedSession()
        
        let shortTask = descriptionSession.dataTaskWithURL(unwrappedShortURL) { (data, response, error) in
            
            guard let shortPlotData = data else {fatalError("unable to get short plot description data \(error?.localizedDescription)")}
            do {
                
                let shortPlotDictionary = try NSJSONSerialization.JSONObjectWithData(shortPlotData, options: []) as! NSDictionary
                
                
                print("i'm printing the short dictionary: \(shortPlotDictionary)")
                completion(shortPlotDictionary)
                
            } catch {
                
                print("second error \(error)")
            }
            
        }
        shortTask.resume()
        
    }
    
    
    
    
    class func getFullPlotDescriptionFromSearch(movieID: String, completion:(NSDictionary) ->()) {
    
//    class func getFullPlotDescriptionFromSearch(movie:Movie, completion:(NSDictionary) ->()) {
//        
//        let movieID = movie.imdbID
    
        let fullURLString = "https://www.omdbapi.com/?i=\(movieID)&plot=full&r=json"
        let fullURL = NSURL(string: fullURLString)
        guard let unwrappedfullURL = fullURL else {fatalError("Invalid full plot URL")}
        let fullSession = NSURLSession.sharedSession()
        
        let fullTask = fullSession.dataTaskWithURL(unwrappedfullURL) { (data, response, error) in
            
           guard let fullPlotData = data else {fatalError("Unable to get full plot description data \(error?.localizedDescription)")}
            
            do {
                let fullPlotDictionary = try NSJSONSerialization.JSONObjectWithData(fullPlotData, options: []) as! NSDictionary
//                let movie = Movie(dictionary: fullPlotDictionary)
//                movie.plot = fullPlotDictionary["Plot"] as! String
//                print("I'm printing the full plot: \(movie.plot)")
//                
//                print("I'm printing the full dictionary: \(fullPlotDictionary)")
                completion(fullPlotDictionary)
                
            } catch {
                print("third error \(error)")
            }
        }
        fullTask.resume()
    }
}