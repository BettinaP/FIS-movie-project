//
//  MoviesSearchHomeViewController.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/14/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCollectionCell"

class MoviesSearchHomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let store = MovieDataStore.sharedInstance
    let pageNumber = Int()
    var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //URLS cannot take spaces you must use a + instead so you have to add some kind of check to ensure that searchedTitle (which comes from the search bar) deals with the space
        store.searchedTitle = "Game+of+Thrones"
        store.getMovieBasicSearchResultsWithCompletion { storeDictionaryArray in
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                self.moviesCollectionView.reloadData()
            })
            //        print((storeDictionaryArray))
        }
        
        
        
        
//        OMDBAPIClient.getMovieBasicSearchResults("Batman", searchPage: 2) { dictionary in
//            //print(dictionary)
//            
//            
//        }
//        
//        OMDBAPIClient.getShortPlotDescriptionFromSearch("tt0097757") { (dictionary) in
//            print("I'm the short description \(dictionary)")
//        }
//        
//        OMDBAPIClient.getFullPlotDescriptionFromSearch("tt1119646") { (dictionary) in
//            print("i'm the long description \(dictionary)")
//        }
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        moviesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        moviesCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "movieCollectionCell")
        
        moviesCollectionView.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(moviesCollectionView)
        
        self.moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.moviesCollectionView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.moviesCollectionView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        self.moviesCollectionView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.75).active = true
        self.moviesCollectionView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.85).active = true
        
        self.moviesCollectionView.allowsSelection = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.store.movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let movieCell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell", forIndexPath: indexPath)
        
        let titleLabel = UILabel()
        let posterView = UIImageView()
        
        posterView.contentMode = .ScaleAspectFit
        posterView.clipsToBounds = true
        posterView.tintColor = UIColor.yellowColor()
        
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor.redColor()
        titleLabel.font = UIFont(name: "Arial", size: 16.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        movieCell.addSubview(posterView)
        movieCell.addSubview(titleLabel)
        
        let movie: Movie = self.store.movies[indexPath.row]
        posterView.image = UIImage(named: movie.moviePosterImage)
        titleLabel.text = movie.title
        print("movie cell \(indexPath.row) is getting created")
        movieCell.backgroundColor = UIColor.blueColor()
        
        return movieCell
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
