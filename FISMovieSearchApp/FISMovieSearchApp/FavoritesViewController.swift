//
//  FavoritesViewController.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 10/3/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit
import CoreData

let reuseIdentifier2 = "favoritesCell"

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoritesTableView = UITableView()
    var savedFavorites = [FavoriteMovie]()
    var store = MovieDataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Plain)
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.registerClass(FavoriteMovieTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(FavoriteMovieTableViewCell))
        self.view.addSubview(self.favoritesTableView)
        
        store.fetchData() 
        
        savedFavorites = store.favoriteMovies
        
        self.favoritesTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        store.fetchData()
        
        savedFavorites = store.favoriteMovies
        
        self.favoritesTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("before deleting:\(savedFavorites.count)")
        return self.savedFavorites.count
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  favoriteMovieCell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(FavoriteMovieTableViewCell), forIndexPath: indexPath) as! FavoriteMovieTableViewCell
        
        let favoriteMovieSelected = self.savedFavorites[indexPath.row]
        
        favoriteMovieCell.configureFavoriteMovieCell(favoriteMovieSelected)
        
        return favoriteMovieCell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("before deleting:\(savedFavorites.count)")
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let savedFavorite = savedFavorites[indexPath.row]
            store.managedObjectContext.deleteObject(savedFavorite)
            savedFavorites.removeAtIndex(indexPath.row)
            favoritesTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            store.fetchData()
            store.saveContext()
            favoritesTableView.reloadData()
            print("after deleting:\(savedFavorites.count)")
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("favoritesToMovieInfo", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC: MovieInfoViewController = segue.destinationViewController as! MovieInfoViewController
        
        if segue.identifier == "favoritesToMovieInfo" {
            
            let selectedCell = sender as! UITableViewCell
            
            let favoriteSelected = self.favoritesTableView.indexPathForCell(selectedCell)
            
            let favorite = self.savedFavorites[favoriteSelected!.row]
            
            let movieToPass = Movie()
            
            if let unwrappedTitle = favorite.title {
                movieToPass.title = unwrappedTitle
            }
            
           
            if let unwrappedIMDBID = favorite.imdbID {
                movieToPass.imdbID = unwrappedIMDBID
            }
            
            
            if let unwrappedYear = favorite.year {
                movieToPass.year = unwrappedYear
            }
            
            
            if let unwrappedType = favorite.type{
                movieToPass.type =  unwrappedType
            }
            
            
            if let  unwrappedPosterURL = favorite.posterURL {
                movieToPass.moviePosterURL =  unwrappedPosterURL
            }
            
            
            if let unwrappedRated = favorite.rated {
                movieToPass.rated =   unwrappedRated
            }
            
            
            if let unwrappedReleased = favorite.releaseDate {
                movieToPass.released = unwrappedReleased
            }
            
            
            if let unwrappedRuntime = favorite.runtime {
                movieToPass.runTime = unwrappedRuntime
            }
            
            
            if let unwrappedGenre = favorite.genre {
                movieToPass.genre = unwrappedGenre
            }
            
            
            if let unwrappedDirector = favorite.director {
                movieToPass.director = unwrappedDirector
            }
            
            
            if let unwrappedWriter = favorite.writer {
                movieToPass.writer = unwrappedWriter
            }
            
            
            
            if let unwrappedActors = favorite.actors{
                movieToPass.actors = unwrappedActors
            }
            
            
            
            if let  unwrappedPlot = favorite.plot {
                movieToPass.plot = unwrappedPlot
            }
            
            
            if let unwrappedLanguage = favorite.language {
                movieToPass.language = unwrappedLanguage
            }
            
            
            if let unwrappedAwards = favorite.awards {
                movieToPass.awards = unwrappedAwards
            }
           
            
            if let unwrappedIMDBRating = favorite.imdbRating {
                movieToPass.imdbRating = unwrappedIMDBRating
            }
          
            
            
            if let unwrappedMetaScore = favorite.metaScore {
                movieToPass.metaScore = unwrappedMetaScore
            }
            
            
            if let unwrappedResponse = favorite.response {
                movieToPass.response = unwrappedResponse
            }
        
            
            destVC.moviePassed = movieToPass
            destVC.configureView(destVC.moviePassed)
            
        }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}




