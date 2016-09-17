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
        
        // TO DO: add search bar to nav bar
        
        
        //URLS cannot take spaces you must use a + instead so you have to add some kind of check to ensure that searchedTitle (which comes from the search bar) deals with the space
        //        store.searchedTitle = "Game+of+Thrones"
        store.getMovieBasicSearchResultsWithCompletion("The+Hangover") { success in
            
            // TO DO: USE DATASTORE ARRAY TO POPULATE COLLECTION VIEW
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
        self.moviesCollectionView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.moviesCollectionView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.95).active = true
        
        self.moviesCollectionView.allowsSelection = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.store.movieResults.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let movieCell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell", forIndexPath: indexPath)
        
        let titleLabel = UILabel()
        let yearLabel = UILabel()
        let posterView = UIImageView()
        
        posterView.contentMode = .ScaleAspectFit
        posterView.clipsToBounds = true
        posterView.tintColor = UIColor.yellowColor()
        
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        titleLabel.textColor = UIColor.redColor()
        titleLabel.font = UIFont(name: "Arial", size: 16.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.sizeToFit()
        
        yearLabel.textAlignment = NSTextAlignment.Center
        yearLabel.textColor = UIColor.redColor()
        yearLabel.font = UIFont(name: "Arial", size: 12.0)
        yearLabel.adjustsFontSizeToFitWidth = true
        yearLabel.sizeToFit()
        
        movieCell.addSubview(posterView)
        movieCell.addSubview(titleLabel)
        movieCell.addSubview(yearLabel)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.widthAnchor.constraintEqualToAnchor(movieCell.widthAnchor).active = true
        posterView.heightAnchor.constraintEqualToAnchor(movieCell.heightAnchor, multiplier: 0.75).active = true
        posterView.topAnchor.constraintEqualToAnchor(movieCell.topAnchor).active = true
        posterView.leadingAnchor.constraintEqualToAnchor(movieCell.leadingAnchor).active = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraintEqualToAnchor(movieCell.centerXAnchor).active = true
        titleLabel.topAnchor.constraintEqualToAnchor(posterView.bottomAnchor).active = true
        titleLabel.widthAnchor.constraintEqualToAnchor(movieCell.widthAnchor).active = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.centerXAnchor.constraintEqualToAnchor(movieCell.centerXAnchor).active = true
        yearLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor).active = true
        yearLabel.widthAnchor.constraintEqualToAnchor(movieCell.widthAnchor).active = true
        
        
        let movieSelected = self.store.movieResults[indexPath.row]
        
        
        if movieSelected.moviePosterImage != "N/A" {
            
            
            let posterURL = NSURL(string: movieSelected.moviePosterImage)
            guard let unwrappedPosterURL = posterURL else {fatalError("could not get image url")}
            
            print("\n\n\n\n our print\(unwrappedPosterURL)")
            
            guard let posterData = NSData(contentsOfURL: unwrappedPosterURL) else {assertionFailure("could not get image data"); return movieCell}
            posterView.image = UIImage(data: posterData)
            
        } else {
            
            movieCell.backgroundColor = UIColor.greenColor()
            
        }
        //            UIImage(imageWithData: NSData(imageURL))
        titleLabel.text = movieSelected.title
        
        yearLabel.text = movieSelected.year
        
        print("movie cell \(indexPath.row) is getting created")
//        movieCell.backgroundColor = UIColor.blueColor()
        
        return movieCell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width/3.5, view.frame.height/4.5)
    }
    
    //    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    //        <#code#>
    //    }
    //    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    //         Pass the selected object to the new view controller.
    //    }
    //    */
    
}
