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
    let directorLabel = UILabel()
    let actorsLabel = UILabel()
    let imdbScoreLabel = UILabel()
    let metaScoreLabel = UILabel()
    let genreLabel = UILabel()
    let ratedLabel = UILabel()
    let runtimeLabel = UILabel()
    let posterView = UIImageView()
    let cellPosterURL = String()
    let starringLabel = UILabel()
    let directedByLabel = UILabel()
  
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
        
         super.init(style: .Default, reuseIdentifier: NSStringFromClass(FavoriteMovieTableViewCell))
         setupFavoriteCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    func setupFavoriteCellViews() {
        posterView.contentMode = .ScaleAspectFill
        posterView.clipsToBounds = true
        
        self.backgroundColor =  UIColor(white: 0.2, alpha: 0.2)
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.6
       
    
        titleAndYearLabel.textAlignment = NSTextAlignment.Natural
        titleAndYearLabel.numberOfLines = 0
        titleAndYearLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        titleAndYearLabel.textColor = UIColor.blackColor()
        titleAndYearLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        titleAndYearLabel.adjustsFontSizeToFitWidth = true
        titleAndYearLabel.sizeToFit()
        titleAndYearLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        directedByLabel.adjustsFontSizeToFitWidth = true
        directedByLabel.sizeToFit()
        directedByLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        
        directorLabel.numberOfLines = 0
        directorLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        directorLabel.sizeToFit()
        directorLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        
        starringLabel.numberOfLines = 1
        starringLabel.adjustsFontSizeToFitWidth = false
        starringLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        
        actorsLabel.numberOfLines = 2
        actorsLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        actorsLabel.sizeToFit()
        actorsLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        
        imdbScoreLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        imdbScoreLabel.numberOfLines = 0
        imdbScoreLabel.adjustsFontSizeToFitWidth = true
        imdbScoreLabel.sizeToFit()
        imdbScoreLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        
        metaScoreLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        metaScoreLabel.numberOfLines = 0
        metaScoreLabel.sizeToFit()
        metaScoreLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        metaScoreLabel.layer.borderColor = UIColor.blackColor().CGColor
        metaScoreLabel.layer.borderWidth = 1
        
        genreLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        genreLabel.numberOfLines = 0
        genreLabel.sizeToFit()
        genreLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        
        runtimeLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        runtimeLabel.numberOfLines = 0
        runtimeLabel.sizeToFit()
        runtimeLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        
        ratedLabel.sizeToFit()
        ratedLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)
        ratedLabel.layer.borderColor = UIColor.blackColor().CGColor
        ratedLabel.layer.borderWidth = 1
        
        self.addSubview(posterView)
        self.addSubview(titleAndYearLabel)
        self.addSubview(starringLabel)
        self.addSubview(directedByLabel)
        self.addSubview(directorLabel)
        self.addSubview(actorsLabel)
        self.addSubview(imdbScoreLabel)
        self.addSubview(metaScoreLabel)
        self.addSubview(genreLabel)
        self.addSubview(ratedLabel)
        self.addSubview(runtimeLabel)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.20).active = true
        posterView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
        posterView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        posterView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        
        titleAndYearLabel.translatesAutoresizingMaskIntoConstraints = false
        titleAndYearLabel.leadingAnchor.constraintEqualToAnchor(posterView.trailingAnchor).active = true
        titleAndYearLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.8).active = true
        titleAndYearLabel.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        
        ratedLabel.translatesAutoresizingMaskIntoConstraints = false
        ratedLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        ratedLabel.topAnchor.constraintEqualToAnchor(self.titleAndYearLabel.bottomAnchor, constant: self.frame.height * 0.1).active = true
        
        runtimeLabel.translatesAutoresizingMaskIntoConstraints = false
        runtimeLabel.leadingAnchor.constraintEqualToAnchor(ratedLabel.trailingAnchor).active = true
        runtimeLabel.topAnchor.constraintEqualToAnchor(self.titleAndYearLabel.bottomAnchor, constant: self.frame.height * 0.1).active = true
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        genreLabel.topAnchor.constraintEqualToAnchor(self.ratedLabel.bottomAnchor, constant: self.frame.height * 0.1).active = true
        
        imdbScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        imdbScoreLabel.leadingAnchor.constraintEqualToAnchor(posterView.trailingAnchor).active = true
        imdbScoreLabel.topAnchor.constraintEqualToAnchor(self.genreLabel.bottomAnchor, constant: self.frame.height * 0.1).active = true
        
        metaScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        metaScoreLabel.leftAnchor.constraintEqualToAnchor(imdbScoreLabel.rightAnchor).active = true
        metaScoreLabel.topAnchor.constraintEqualToAnchor(self.genreLabel.bottomAnchor, constant: self.frame.height * 0.1).active = true
        
        starringLabel.translatesAutoresizingMaskIntoConstraints = false
        starringLabel.leadingAnchor.constraintEqualToAnchor(posterView.trailingAnchor).active = true
        starringLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.15).active = true
        starringLabel.trailingAnchor.constraintEqualToAnchor(actorsLabel.leadingAnchor).active = true
        starringLabel.topAnchor.constraintEqualToAnchor(self.imdbScoreLabel.bottomAnchor, constant: self.frame.height * 0.088).active = true
        
        actorsLabel.translatesAutoresizingMaskIntoConstraints = false 
        actorsLabel.leadingAnchor.constraintEqualToAnchor(starringLabel.trailingAnchor).active = true
        actorsLabel.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        actorsLabel.topAnchor.constraintEqualToAnchor(self.imdbScoreLabel.bottomAnchor, constant: self.frame.height * 0.088).active = true
        
        directedByLabel.translatesAutoresizingMaskIntoConstraints = false
        directedByLabel.leadingAnchor.constraintEqualToAnchor(posterView.trailingAnchor).active = true
        directedByLabel.trailingAnchor.constraintEqualToAnchor(directorLabel.leadingAnchor).active = true
        directedByLabel.topAnchor.constraintEqualToAnchor(self.actorsLabel.bottomAnchor, constant:  self.frame.height * 0.088).active = true
        directedByLabel.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -(self.frame.height * 0.1)).active = true
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        directorLabel.leadingAnchor.constraintEqualToAnchor(directedByLabel.trailingAnchor).active = true
        directorLabel.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        directorLabel.topAnchor.constraintEqualToAnchor(self.actorsLabel.bottomAnchor, constant:  self.frame.height * 0.088).active = true
        directorLabel.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -(self.frame.height * 0.1)).active = true
     
    }
    
    
    func configureFavoriteMovieCell(favoriteMovie: FavoriteMovie) {
        
        
        if let unwrappedTitle = favoriteMovie.title, unwrappedYear = favoriteMovie.year, unwrappedRated = favoriteMovie.rated, unwrappedGenre = favoriteMovie.genre, unwrappedActors = favoriteMovie.actors, unwrappedRuntime = favoriteMovie.runtime, unwrappedMetaScore = favoriteMovie.metaScore, unwrappedIMDBRating = favoriteMovie.imdbRating, unwrappedDirector = favoriteMovie.director {
            
            self.titleAndYearLabel.text = "\(unwrappedTitle) (\(unwrappedYear))"
            self.ratedLabel.text = "  \(unwrappedRated)  "
            self.runtimeLabel.text = "  \(unwrappedRuntime) "
            self.genreLabel.text = "\(unwrappedGenre)"
            self.starringLabel.text = "Starring: "
            self.actorsLabel.text = "\(unwrappedActors)"
            self.directedByLabel.text = "Directed by: "
            self.directorLabel.text = "\(unwrappedDirector)"
            self.imdbScoreLabel.text = "⭐️\(unwrappedIMDBRating)  "
            self.metaScoreLabel.text = " \(unwrappedMetaScore) Metascore "
           
            if Int(unwrappedMetaScore) < 40  && Int(unwrappedMetaScore) > 0 {
                
                self.metaScoreLabel.backgroundColor = UIColor.redColor()
                
            } else if 40 <= Int(unwrappedMetaScore) && Int(unwrappedMetaScore) <= 60 {
                
                self.metaScoreLabel.backgroundColor = UIColor.yellowColor()
                
            } else if unwrappedMetaScore == "N/A" {
                
                self.metaScoreLabel.backgroundColor = UIColor.grayColor()
            
            } else {
        
                self.metaScoreLabel.backgroundColor = UIColor.greenColor()
            }
            
        }
        
//        guard let unwrappedTitle = favoriteMovie.title else {print("AN ERROR -title- OCCURRED HERE"); continue}
//        guard let unwrappedYear = favoriteMovie.year else {print("AN ERROR - year- OCCURRED HERE"); continue}
//        guard let unwrappedRated = favoriteMovie.rated else {print("AN ERROR - rated- OCCURRED HERE"); continue}
//        guard let unwrappedGenre = favoriteMovie.genre else {print("AN ERROR -genre- OCCURRED HERE"); continue}
//        guard let unwrappedRuntime = favoriteMovie.runtime else {print("AN ERROR - runtime- OCCURRED HERE"); return}
//        guard let unwrappedActors = favoriteMovie.actors else {print("AN ERROR - actors- OCCURRED HERE"); return}
        
//        self.titleAndYearLabel.text = "\(unwrappedTitle) (\(unwrappedYear))"
//        self.ratedLabel.text = "\(unwrappedRated)"
//        self.genreLabel.text = "\(unwrappedGenre)"
//        self.runtimeLabel.text = "\(unwrappedRuntime)"
//        self.actorsLabel.text = "\(unwrappedActors)"
        
        self.showActivityIndicator(self.posterView)
        
        guard let unwrappedFavPosterURL = favoriteMovie.posterURL else {print("error unwrapping posterURL"); return}
        
        if  unwrappedFavPosterURL == "N/A" {
            
            posterView.image = UIImage(named: "no-movie-icon-14032.png")
            self.stopActivityIndicator(self.posterView)
            
        } else if unwrappedFavPosterURL.characters.count > 0 {
            
            
            let posterURL = NSURL(string: unwrappedFavPosterURL)
            guard let unwrappedPosterURL = posterURL else {print("Could not get image URL"); return}
             
            guard let posterData = NSData(contentsOfURL: unwrappedPosterURL) else { print("Could not get image data"); return }
            NSOperationQueue.mainQueue().addOperationWithBlock({
                
                //TODO: Put back in the loader that needs to go here
            
                //  deciding whether or not to keep fade in animation of movies appearing:
                self.posterView.alpha = 0
                
                self.posterView.image = UIImage(data: posterData)
                
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
    
}
