//
//  CustomMovieSearchCell.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/21/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class CustomMovieSearchCell: UICollectionViewCell {
    
    
    let store = MovieDataStore.sharedInstance
    let titleLabel = UILabel()
    let yearLabel = UILabel()
    let posterView = UIImageView()
    let cellPosterURL = String()
    let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    

    override init(frame: CGRect) {
        super.init(frame: frame) 
        self.backgroundColor = UIColor(white: 0.4, alpha: 0.2)
        setupViews() 
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        
        posterView.contentMode = .ScaleToFill
        posterView.clipsToBounds = true
        
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont(name: "Arial", size: 15.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.sizeToFit()
        titleLabel.backgroundColor = UIColor.lightGrayColor()
        
        yearLabel.textAlignment = NSTextAlignment.Center
        yearLabel.textColor = UIColor.blackColor()
        yearLabel.font = UIFont(name: "Arial", size: 12.0)
        yearLabel.adjustsFontSizeToFitWidth = true
        yearLabel.sizeToFit()
        
        self.addSubview(posterView)
        self.addSubview(titleLabel)
        self.addSubview(yearLabel)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        posterView.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.75).active = true
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
        
        if  movie.moviePosterURL == "N/A" {

            posterView.image = UIImage(named: "no-movie-icon-14032.png")
            
        } else if movie.moviePosterURL.characters.count > 0 {
            
            let posterURL = NSURL(string: movie.moviePosterURL)
            guard let unwrappedPosterURL = posterURL else {print("Could not get image URL"); return}
            print(unwrappedPosterURL)
            guard let posterData = NSData(contentsOfURL: unwrappedPosterURL) else { assertionFailure("Could not get image data"); return }
            NSOperationQueue.mainQueue().addOperationWithBlock({
//  deciding whether or not to keep fade in animation of movies appearing:
//                self.posterView.alpha = 0
                self.posterView.image = UIImage(data: posterData)
//                UIView.animateWithDuration(0.3, animations: {
//                    self.posterView.alpha = 1
                })
//
                
//            })
            
        } else {
            print("\n\ndefault image\n\n")
            posterView.image = UIImage(named: "no movie-icon-14032.png")
            
        }
        

    }
    
    
    
    func showActivityIndicator(loadingView: UIView){
    
        loadingIndicator.frame = frame
        loadingIndicator.center = loadingView.center
        loadingIndicator.hidesWhenStopped = true
        loadingView.addSubview(loadingIndicator)
        self.addSubview(loadingView)
        loadingIndicator.startAnimating()
        
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = ""
        self.yearLabel.text = ""
        self.posterView.image = nil
    
    }
    


}
