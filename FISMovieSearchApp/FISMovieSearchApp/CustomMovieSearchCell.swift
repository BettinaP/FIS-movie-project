//
//  CustomMovieSearchCell.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/21/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class CustomMovieSearchCell: UICollectionViewCell {
    
    
    var store = MovieDataStore.sharedInstance
    let titleLabel = UILabel()
    let yearLabel = UILabel()
    let posterView = UIImageView()
    let cellPosterURL = String()
    let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0.3, alpha: 0.1)
        setupViews()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        
        posterView.contentMode = .ScaleToFill
        posterView.clipsToBounds = true
        
        titleLabel.textAlignment = NSTextAlignment.Center
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.sizeToFit()
        
        yearLabel.textAlignment = NSTextAlignment.Center
        yearLabel.textColor = UIColor.blackColor()
        yearLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        yearLabel.adjustsFontSizeToFitWidth = true
        yearLabel.sizeToFit()
        
        self.addSubview(posterView)
        self.addSubview(titleLabel)
        self.addSubview(yearLabel)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        posterView.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.80).active = true
        posterView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        posterView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        titleLabel.topAnchor.constraintEqualToAnchor(posterView.bottomAnchor).active = true
        titleLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        yearLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor).active = true
        yearLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        
    }
    
    
    func configureMovieCell(movie: Movie) {
        
        self.titleLabel.text = movie.title
        self.yearLabel.text = movie.year
        
        self.showActivityIndicator(self.posterView)
        
        if  movie.moviePosterURL == "N/A" {
            
            posterView.image = UIImage(named: "no-movie-icon-14032.png")
            self.stopActivityIndicator(self.posterView)
            
        } else if movie.moviePosterURL.characters.count > 0 {
            
            
            let posterURL = NSURL(string: movie.moviePosterURL)
            guard let unwrappedPosterURL = posterURL else {print("Could not get image URL"); return}
         
            guard let posterData = NSData(contentsOfURL: unwrappedPosterURL) else { assertionFailure("Could not get image data"); return }
            NSOperationQueue.mainQueue().addOperationWithBlock({
                
                //TODO: Put back in the loader that needs to go here
                
                
                //  deciding whether or not to keep fade in animation of movies appearing:
                self.posterView.alpha = 0
                
                self.posterView.image = UIImage(data: posterData)
                
                
//                if self.posterView.image == UIImage(data: posterData) {
//                    self.stopActivityIndicator(self.posterView)
//                }
                
                UIView.animateWithDuration(0.3, animations: {
                        self.posterView.alpha = 1
                })
                self.stopActivityIndicator(self.posterView)
            
            })
            
        } else {
            posterView.image = UIImage(named: "no movie-icon-14032.png")
            
        }
        
        
    }
    
    
    
    func showActivityIndicator(loadingView: UIView) {
        
        loadingIndicator.frame = frame
        loadingIndicator.center = loadingView.center
        loadingIndicator.hidesWhenStopped = true
        loadingView.addSubview(loadingIndicator)
        self.addSubview(loadingView)
        loadingIndicator.startAnimating()
        
    }
    
    func stopActivityIndicator(loadingView: UIView){
        
        loadingIndicator.stopAnimating()
        
        loadingIndicator.hidesWhenStopped = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = ""
        self.yearLabel.text = ""
        self.posterView.image = nil
        
    }
    
    
    
}
