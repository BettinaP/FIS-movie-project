//
//  MoviesSearchHomeViewController.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/14/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCollectionCell"

class MoviesSearchHomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    
    let store = MovieDataStore.sharedInstance
    var pageNumber = 1
    var moviesCollectionView: UICollectionView!
    var defaultSearchTerms = ["love", "adventure","who", "night", "day", "space", "girl", "man", "funny"]
    var term = String()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if searchBar.text == "" || searchBar.text == " " {
            
            let index = Int(arc4random_uniform(9))
            term = defaultSearchTerms[index]
        
            store.getSearchResultsByPageWithCompletion(term, searchPage: pageNumber, completion: { success in
                NSOperationQueue.mainQueue().addOperationWithBlock({ 
                    self.moviesCollectionView.reloadData()
                })
            })
            
            
            
            
//            store.getBasicSearchResultsWithCompletion(term) { success in
//                print("inside api call in ViewDidLoad, term passed: \(self.term)")
//                NSOperationQueue.mainQueue().addOperationWithBlock({
//                    self.moviesCollectionView.reloadData()
//                    print("yo \(self.store.movieResults)")
//                })
//                
//            }
            
        }
        
        setupCollectionView()
        
    }
    
    
    
    func setupCollectionView(){
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search for movie"
        self.navigationItem.titleView = searchBar
        searchBar.setShowsCancelButton(true, animated: false)
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
       
    
        moviesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        moviesCollectionView.registerClass(CustomMovieSearchCell.self, forCellWithReuseIdentifier: NSStringFromClass(CustomMovieSearchCell))
        moviesCollectionView.backgroundColor = UIColor(white: 0.2, alpha: 0.2)
        self.view.addSubview(moviesCollectionView)
        
        
        self.moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.moviesCollectionView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.moviesCollectionView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        self.moviesCollectionView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.moviesCollectionView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.95).active = true
        
        
        self.moviesCollectionView.allowsSelection = true
        self.moviesCollectionView.pagingEnabled = true
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        term = searchBar.text!
        print(term)
        let queue = NSOperationQueue()
    
        queue.addOperationWithBlock {
            self.store.getSearchResultsByPageWithCompletion(self.term, searchPage: self.pageNumber) { success in
                
                
                // TO DO: USE DATASTORE ARRAY TO POPULATE COLLECTION VIEW
                print(success)
                NSOperationQueue.mainQueue().addOperationWithBlock({
                    self.moviesCollectionView.reloadData()
                    print(self.store.movieResults)
                })
            }
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        //        searchBarSearchButtonClicked(self.searchBar)
        self.moviesCollectionView.reloadData()
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.store.movieResults.count
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let movieCell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(CustomMovieSearchCell), forIndexPath: indexPath) as! CustomMovieSearchCell
        
        let movieSelected = self.store.movieResults[indexPath.row]
        
        movieCell.configureMovieCell(movieSelected)
        
        
        return movieCell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width/3.5, view.frame.height/3.0)
    }

    
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.item == self.store.movieResults.count - 2 {
        pageNumber += 1
        
            store.getSearchResultsByPageWithCompletion(term, searchPage: pageNumber, completion: { success in
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                
                self.moviesCollectionView.reloadData()
            })
        })
        print("load more")
        
        }
        
    }
    
    //    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    //           //Tells the delegate that the cancel button was tapped, typically to dismiss search bar.
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
