//
//  OMDBAPIClient.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/12/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class OMDBAPIClient {
    
    //by title & diff plot length
    
    // http://www.omdbapi.com/?t=Batman&y=&plot=short&r=json
    // http://www.omdbapi.com/?t=batman&y=&plot=full&r=json

    
    //by id
    //    http://www.omdbapi.com/?i=tt0097757&plot=short&r=json

    
    // Search pagination added: http://www.omdbapi.com/?s=Batman&page=2

    /*Search =     (
     {
     Poster = "http://ia.media-imdb.com/images/M/MV5BNTM3OTc0MzM2OV5BMl5BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg";
     Title = "Batman Begins";
     Type = movie;
     Year = 2005;
     imdbID = tt0372784;
     }
     */
    
    
    
    class func getSearchResultsByPage(searchTerm: String, searchPage: Int, completion:[String: AnyObject] -> ()) {
        
        let editedSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+").lowercaseString
        
        let urlString = "https://www.omdbapi.com/?s=\(editedSearchTerm)&page=\(searchPage)"
        print(urlString)
        print(searchPage)
        
        let searchURL = NSURL(string: urlString)
        print(searchURL)
        
        let searchSession = NSURLSession.sharedSession()
        //let searchSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        guard let unwrappedSearchURL = searchURL else {fatalError("Invalid URL")}
        
        
        searchSession.dataTaskWithURL(unwrappedSearchURL) { (data, response, error) in
            
            guard let searchData = data else {fatalError("Unable to get data \(error?.localizedDescription)")}
            
            do {
                let basicSearchDictionary = try NSJSONSerialization.JSONObjectWithData(searchData, options: NSJSONReadingOptions.AllowFragments) as! [String : AnyObject]
                
                guard let unwrappedBasicSearchDictionary = basicSearchDictionary as? [String : AnyObject] else {return}
                
                completion(unwrappedBasicSearchDictionary)
                
            } catch {
                
                print("this is the first \(error)")
            }
            
            
            }.resume()
        
    }
    
    
    
    //by id http://www.omdbapi.com/?i=tt0097757&plot=short&r=json
    
    
    class func getShortPlotDescriptionFromSearch(movieID: String, completion:(NSDictionary) ->()) {
      
        let shortURLString = "https://www.omdbapi.com/?i=\(movieID)&plot=short&r=json"
        let shortURL = NSURL(string: shortURLString)
        guard let unwrappedShortURL = shortURL else {fatalError("Invalid URL")}
        
        let shortSession = NSURLSession.sharedSession()
        
        let shortTask = shortSession.dataTaskWithURL(unwrappedShortURL) { (data, response, error) in
            
            guard let shortPlotData = data else {fatalError("unable to get short plot description data \(error?.localizedDescription)")}
            do {
                
                let shortPlotDictionary = try NSJSONSerialization.JSONObjectWithData(shortPlotData, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                
                print("i'm printing the short plot dictionary: \(shortPlotDictionary)")
                completion(shortPlotDictionary)
                
            } catch {
                
                print("second error \(error)")
            }
            
        }
        shortTask.resume()
        
    }
    
    
    
    
    class func getFullPlotDescriptionFromSearch(movieID: String, completion:(NSDictionary) ->()) {
 
        let fullURLString = "https://www.omdbapi.com/?i=\(movieID)&plot=full&r=json"
        let fullURL = NSURL(string: fullURLString)
        guard let unwrappedfullURL = fullURL else {fatalError("Invalid full plot URL")}
        
        let fullSession = NSURLSession.sharedSession()
        
        let fullTask = fullSession.dataTaskWithURL(unwrappedfullURL) { (data, response, error) in
            
            guard let fullPlotData = data else {fatalError("Unable to get full plot description data \(error?.localizedDescription)")}
            
            do {
                let fullPlotDictionary = try NSJSONSerialization.JSONObjectWithData(fullPlotData, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                
                let fullPlot = fullPlotDictionary["Plot"]
                print("i am the full dictionary: \(fullPlotDictionary)")
                
                completion(fullPlotDictionary)
                
                print("full plot dictionary: \(fullPlot)")
            } catch {
                print("third error \(error)")
            }
        }
        fullTask.resume()
    }
}