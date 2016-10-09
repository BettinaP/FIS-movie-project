//
//  FavoritesViewController.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 10/3/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit
import CoreData

 

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoritesTableView = UITableView()
    var savedFavorites = [FavoriteMovie]()
    var store = MovieDataStore.sharedInstance
//    var deleteAllButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        deleteAllButton = UIBarButtonItem(title: "Delete All", style: .Plain, target: self, action: "deleteAll()")
//        navigationItem.rightBarButtonItem = deleteAllButton
        
        favoritesTableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Plain)
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.registerClass(FavoriteMovieTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(FavoriteMovieTableViewCell))
        self.view.addSubview(self.favoritesTableView)
        
        self.navigationItem.title =  "FAVORITES"
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

        return self.savedFavorites.count
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 150
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  favoriteMovieCell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(FavoriteMovieTableViewCell), forIndexPath: indexPath) as! FavoriteMovieTableViewCell
        
        let favoriteMovieSelected = self.savedFavorites[indexPath.row]
        
//        favoriteMovieCell.backgroundColor = UIColor.getRandomColor()
        
        favoriteMovieCell.configureFavoriteMovieCell(favoriteMovieSelected)
        
        return favoriteMovieCell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let savedFavorite = savedFavorites[indexPath.row]
            store.managedObjectContext.deleteObject(savedFavorite)
            savedFavorites.removeAtIndex(indexPath.row)
            favoritesTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            store.fetchData()
            store.saveContext()
            favoritesTableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("favoritesToMovieInfo", sender: favoritesTableView.cellForRowAtIndexPath(indexPath))
        favoritesTableView.cellForRowAtIndexPath(indexPath)?.highlighted = true
    }
    
    
    func setHighlighted(_highlighted: Bool, animated: Bool) {
        
        
        
    
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


//extension UIColor{
//    class func getRandomColor() -> UIColor{
//        let red = CGFloat(drand48())
//        let green = CGFloat(drand48())
//        let blue = CGFloat(drand48())
//        
//        
//        
//        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}



