//
//  OMDBAPIClient.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/12/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class OMDBAPIClient {
    
    
    class func getMovieBasicSearchResults(searchTitle: String, searchPage: String, completion: NSArray -> ()) {
        
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
        
        let urlString = "https://www.omdbapi.com/?s=\(searchTitle)&page=\(searchPage)"
        let searchURL = NSURL(string: urlString)
        let searchSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        guard let unwrappedSearchURL = searchURL else {fatalError("Invalid URL")}
        
        let searchRequest = NSMutableURLRequest(URL: unwrappedSearchURL)
        searchRequest.HTTPMethod = "GET"
        
        searchSession.dataTaskWithRequest(searchRequest) { (data, response, error) in
            print(data)
            print(response)
            print(error)
            
            guard let searchData = data else {fatalError("Unable to get data \(error?.localizedDescription)")}
            
            do {
                let basicSearchArray = try NSJSONSerialization.JSONObjectWithData(searchData, options: NSJSONReadingOptions.AllowFragments) as? NSArray //array of dictionaries
                print("Im printing basic dictionary \(basicSearchArray)")
                guard let unwrappedBasicSearchArray = basicSearchArray else {return}
//                let basicSearch = unwrappedBasicSearchDictionary["Search"] as! NSArray
//                print("Im printing basic search \(basicSearch)")
//                
//                let basicPoster = basicSearch["Poster"] as! String
//                print("Im printing basic poster URL \(basicPoster)")
//                let basicTitle = basicSearch["Title"] as! String
//                print("Im printing basic title \(basicTitle)")
//                let basicYear = unwrappedBasicSearchDictionary["Year"] as! String
//                print("Im printing basic year\(basicYear)")
                
                print(unwrappedBasicSearchArray)
                completion(unwrappedBasicSearchArray)
                
            } catch {
                
                print(error)
            }
            
            
        }.resume()
        
    }
    
    
    
    
    
    
}