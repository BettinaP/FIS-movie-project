//
//  MovieDataStore.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/13/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation
import CoreData

class MovieDataStore {
    
    static let sharedInstance = MovieDataStore()
    private init() {}
    
    var movieResults: [Movie] = []
    var totalSearchResults : Int = 0
    var plotSummary = String()
    var resultPage: Int = 1
    var favoriteMovies = [FavoriteMovie]()
    
    
    func getSearchResultsByPageWithCompletion(searchedTerm: String, searchPage: Int, completion:(Bool) -> ()) {
        
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
                    }
                }
                    completion(true)
            }
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
            
            completion(true)
        }
        
    }
    
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    
    
    func fetchData () //perform a fetch request to fill an array property on your datastore
    {
        let favoritesFetch = NSFetchRequest(entityName: FavoriteMovie.entityName)

        let titleSorter  = NSSortDescriptor(key: "title", ascending: true)
        
        favoritesFetch.sortDescriptors = [titleSorter]
        
        do {
            self.favoriteMovies = try self.managedObjectContext.executeFetchRequest(favoritesFetch) as! [FavoriteMovie]
            
        } catch {
            
            fatalError("Failed to fetch messages: \(error)")
            favoriteMovies = []
        }
        
        if favoriteMovies.count == 0 {
            generateTestData()
            
        } 
    }
    
    
    func generateTestData(){ //what's mutating func? what's it's benefit? didn't think anything was changing here.
        
        
        let favoriteMovie1 = NSEntityDescription.insertNewObjectForEntityForName(FavoriteMovie.entityName, inManagedObjectContext: self.managedObjectContext) as! FavoriteMovie
        favoriteMovie1.title = "The Hangover"
        favoriteMovie1.year = "2009"
        favoriteMovie1.imdbID = "tt1119646"
        favoriteMovie1.type = "movie"
        favoriteMovie1.posterURL = "http://ia.media-imdb.com/images/M/MV5BMTU1MDA1MTYwMF5BMl5BanBnXkFtZTcwMDcxMzA1Mg@@._V1_SX300.jpg"
        favoriteMovie1.director = "Todd Phillips"
        favoriteMovie1.writer = "Jon Lucas, Scott Moore"
        favoriteMovie1.actors = "Bradley Cooper, Ed Helms, Zach Galifianakis, Justin Bartha"
        favoriteMovie1.plot = "plot1"
        
        let favoriteMovie2 = NSEntityDescription.insertNewObjectForEntityForName(FavoriteMovie.entityName, inManagedObjectContext: self.managedObjectContext) as! FavoriteMovie
        
        favoriteMovie2.title = "Mulan"
        favoriteMovie2.year = "1998"
        favoriteMovie2.imdbID = "tt0120762"
        favoriteMovie2.type = "movie"
        favoriteMovie2.posterURL = "https://images-na.ssl-images-amazon.com/images/M/MV5BMTIwNjY4NDU2NF5BMl5BanBnXkFtZTcwMzM0OTUyMQ@@._V1_SX300.jpg"
        favoriteMovie2.director = "Tony Bancroft, Barry Cook"
        favoriteMovie2.writer = "Robert D. San Souci (based on a story by), Rita Hsiao (screenplay), Chris Sanders (screenplay), Philip LaZebnik (screenplay), Raymond Singer (screenplay), Eugenia Bostwick-Singer (screenplay), Dean DeBlois (story co-head), John Sanford (story), Chris Williams (story), Tim Hodge (story), Julius Aguimatang (story), Burny Mattinson (story), Lorna Cook (story), Barry Johnson (story), Thom Enriquez (story), Ed Gombert (story), Joe Grant (story), Floyd Norman (story), Linda Woolverton (additional story material), Jodi Ann Johnson (additional story material), Alan Ormsby (additional story material), David Reynolds (additional story material), Don Dougherty (additional story material), Jorgen Klubien (additional story material), Denis Rich (additional story material), Joe Ekers (additional story material), Theodore Newton (additional story material), Larry Scholl (additional story material), Daan Jippes (additional story material), Frank Nissen (additional story material), Jeff Snow (additional story material)"
        favoriteMovie2.actors = "Ming-Na Wen, Lea Salonga, June Foray, Soon-Tek Oh"
        favoriteMovie2.plot = "plot2"
        
        let favoriteMovie3 = NSEntityDescription.insertNewObjectForEntityForName(FavoriteMovie.entityName, inManagedObjectContext: self.managedObjectContext) as! FavoriteMovie
        favoriteMovie3.title = "The Devil Wears Prada"
        favoriteMovie3.year = "2006"
        favoriteMovie3.imdbID = "tt0458352"
        favoriteMovie3.type = "movie"
        favoriteMovie3.posterURL = "https://images-na.ssl-images-amazon.com/images/M/MV5BMTMyNjk4Njc3NV5BMl5BanBnXkFtZTcwNDkyMTEzMw@@._V1_SX300.jpg"
        favoriteMovie3.director = "David Frankel"
        favoriteMovie3.writer = "Aline Brosh McKenna (screenplay), Lauren Weisberger (novel)"
        favoriteMovie3.actors = "Meryl Streep, Anne Hathaway, Emily Blunt, Stanley Tucci"
        favoriteMovie3.plot = "plot3"
        
        saveContext()
        fetchData()
    }
    
    // MARK: - Core Data stack
    // Managed Object Context property getter. This is where we've dropped our "boilerplate" code.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("FavoriteMoviesModel", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    //MARK: Application's Documents directory
    // Returns the URL to the application's Documents directory.
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.FlatironSchool.SlapChat" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    
}