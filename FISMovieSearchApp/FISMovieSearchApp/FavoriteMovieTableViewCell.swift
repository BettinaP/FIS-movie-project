//
//  FavoriteMovieTableViewCell.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 10/4/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell {

    let titleAndYearLabel = UILabel()
//    let yearLabel = UILabel()
    let directorLabel = UILabel()
    let writerLabel = UILabel()
    let actorsLabel = UILabel()
    let posterView = UIImageView()
    let cellPosterURL = String()
    let favLoadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
         super.init(style: .Default, reuseIdentifier: reuseIdentifier)
         setupFavoriteCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    func setupFavoriteCellViews() {
        posterView.contentMode = .ScaleAspectFit
        posterView.clipsToBounds = true
        posterView.backgroundColor = UIColor.blueColor()
        
        titleAndYearLabel.textAlignment = NSTextAlignment.Natural
        titleAndYearLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        titleAndYearLabel.numberOfLines = 0
        titleAndYearLabel.textColor = UIColor.blackColor()
        titleAndYearLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        titleAndYearLabel.adjustsFontSizeToFitWidth = true
        titleAndYearLabel.sizeToFit()
        titleAndYearLabel.backgroundColor = UIColor.lightGrayColor()
        titleAndYearLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        titleAndYearLabel.backgroundColor = UIColor.grayColor()
        
//        yearLabel.textAlignment = NSTextAlignment.Center
//        yearLabel.textColor = UIColor.blackColor()
//        yearLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
//        yearLabel.adjustsFontSizeToFitWidth = true
//        yearLabel.sizeToFit()
//        yearLabel.textAlignment = .Natural
//        yearLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        yearLabel.numberOfLines = 0
        
        directorLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        directorLabel.numberOfLines = 0
        directorLabel.adjustsFontSizeToFitWidth = true
        directorLabel.sizeToFit()
        directorLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        directorLabel.backgroundColor = UIColor.magentaColor()
        writerLabel.backgroundColor = UIColor.purpleColor()
        actorsLabel.backgroundColor = UIColor.redColor()
        
        writerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        writerLabel.numberOfLines = 0
        writerLabel.adjustsFontSizeToFitWidth = true
        writerLabel.sizeToFit()
        writerLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        
        actorsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        actorsLabel.numberOfLines = 0
        actorsLabel.adjustsFontSizeToFitWidth = true
        actorsLabel.sizeToFit()
        actorsLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        
        self.addSubview(posterView)
        self.addSubview(titleAndYearLabel)
//        self.addSubview(yearLabel)
        self.addSubview(directorLabel)
        self.addSubview(writerLabel)
        self.addSubview(actorsLabel)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.20).active = true
        posterView.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.90).active = true
        posterView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        posterView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        
        titleAndYearLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        titleAndYearLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        titleAndYearLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.8).active = true
        
//        yearLabel.translatesAutoresizingMaskIntoConstraints = false
//        yearLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
//        yearLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor).active = true
//        yearLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
//        directorLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        directorLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        directorLabel.topAnchor.constraintEqualToAnchor(self.titleAndYearLabel.bottomAnchor, constant:  self.frame.height * 0.01).active = true
        
        writerLabel.translatesAutoresizingMaskIntoConstraints = false
//        writerLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        
        writerLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        writerLabel.topAnchor.constraintEqualToAnchor(self.directorLabel.bottomAnchor, constant:  self.frame.height * 0.01).active = true
        
       actorsLabel.translatesAutoresizingMaskIntoConstraints = false
//       actorsLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
       actorsLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
       actorsLabel.topAnchor.constraintEqualToAnchor(self.writerLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
    }
    
    
    func configureFavoriteMovieCell(favoriteMovie: FavoriteMovie) {
        guard let unwrappedTitle = favoriteMovie.title else {print("AN ERROR -title- OCCURRED HERE"); return}
        
        guard let unwrappedYear = favoriteMovie.year else {print("AN ERROR - year- OCCURRED HERE"); return}
        self.titleAndYearLabel.text = "\(unwrappedTitle), \(unwrappedYear)"
//        self.yearLabel.text = favoriteMovie.year
        
        self.showActivityIndicator(self.posterView)
        
        guard let unwrappedFavPosterURL = favoriteMovie.posterURL else {print("error unwrapping posterURL"); return}
        if  unwrappedFavPosterURL == "N/A" {
            
            posterView.image = UIImage(named: "no-movie-icon-14032.png")
            self.stopActivityIndicator(self.posterView)
            
        } else if unwrappedFavPosterURL.characters.count > 0 {
            
            
            let posterURL = NSURL(string: unwrappedFavPosterURL)
            guard let unwrappedPosterURL = posterURL else {print("Could not get image URL"); return}
            print(unwrappedPosterURL)
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
        
        favLoadingIndicator.frame = frame
        favLoadingIndicator.center = loadingView.center
        favLoadingIndicator.hidesWhenStopped = true
        loadingView.addSubview(favLoadingIndicator)
        self.addSubview(loadingView)
        favLoadingIndicator.startAnimating()
        
    }
    
    func stopActivityIndicator(loadingView: UIView){
        
        favLoadingIndicator.stopAnimating()
        
        favLoadingIndicator.hidesWhenStopped = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleAndYearLabel.text = ""
//        self.yearLabel.text = ""
        self.posterView.image = nil
        
    }
    
    //    self.releasedLabel.text = "RELEASED: \(movieSelected.released)"
}
