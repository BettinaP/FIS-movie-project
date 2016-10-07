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
    let imdbScoreLabel = UILabel()
    let metaScoreLabel = UILabel()
    let genreLabel = UILabel()
    let ratedLabel = UILabel()
    let runtimeLabel = UILabel()
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
        posterView.backgroundColor = UIColor.getRandomColor()
        
        
        titleAndYearLabel.backgroundColor = UIColor.orangeColor()
        
        
        
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
        
        imdbScoreLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        imdbScoreLabel.numberOfLines = 0
        imdbScoreLabel.adjustsFontSizeToFitWidth = true
        imdbScoreLabel.sizeToFit()
        imdbScoreLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        
        metaScoreLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        metaScoreLabel.numberOfLines = 0
        metaScoreLabel.adjustsFontSizeToFitWidth = true
        metaScoreLabel.sizeToFit()
        metaScoreLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        
        
        genreLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        genreLabel.numberOfLines = 0
        genreLabel.adjustsFontSizeToFitWidth = true
        genreLabel.sizeToFit()
        genreLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        
        
        runtimeLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        runtimeLabel.numberOfLines = 0
        runtimeLabel.adjustsFontSizeToFitWidth = true
        runtimeLabel.sizeToFit()
        runtimeLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        
        
        ratedLabel.adjustsFontSizeToFitWidth = true
        ratedLabel.sizeToFit()
        ratedLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 12.0)
        ratedLabel.layer.borderColor = UIColor.blackColor().CGColor
        ratedLabel.layer.borderWidth = 1
        
        self.addSubview(posterView)
        self.addSubview(titleAndYearLabel)
//        self.addSubview(yearLabel)
        self.addSubview(directorLabel)
        self.addSubview(writerLabel)
        self.addSubview(actorsLabel)
        self.addSubview(imdbScoreLabel)
        self.addSubview(metaScoreLabel)
        self.addSubview(genreLabel)
        self.addSubview(ratedLabel)
        self.addSubview(runtimeLabel)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.20).active = true
        posterView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
        //posterView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        posterView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        
        titleAndYearLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        titleAndYearLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        titleAndYearLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 0.8).active = true
        titleAndYearLabel.topAnchor.constraintEqualToAnchor(self.topAnchor,constant: 40).active = true
        
//        yearLabel.translatesAutoresizingMaskIntoConstraints = false
//        yearLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
//        yearLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor).active = true
//        yearLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        
        
        ratedLabel.translatesAutoresizingMaskIntoConstraints = false
//       ratedLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        ratedLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        ratedLabel.topAnchor.constraintEqualToAnchor(self.titleAndYearLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
        
        
        runtimeLabel.translatesAutoresizingMaskIntoConstraints = false
        //       ratedLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        runtimeLabel.leftAnchor.constraintEqualToAnchor(ratedLabel.rightAnchor).active = true
        runtimeLabel.topAnchor.constraintEqualToAnchor(self.titleAndYearLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
        
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        //       ratedLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        genreLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        genreLabel.topAnchor.constraintEqualToAnchor(self.ratedLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
        
        imdbScoreLabel.translatesAutoresizingMaskIntoConstraints = false
//      imdbScoreLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        imdbScoreLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        imdbScoreLabel.topAnchor.constraintEqualToAnchor(self.genreLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
        
        
        metaScoreLabel.translatesAutoresizingMaskIntoConstraints = false
//       metaScoreLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        metaScoreLabel.leftAnchor.constraintEqualToAnchor(imdbScoreLabel.rightAnchor).active = true
        metaScoreLabel.topAnchor.constraintEqualToAnchor(self.genreLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
        
        
        actorsLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        actorsLabel.topAnchor.constraintEqualToAnchor(self.imdbScoreLabel.bottomAnchor, constant: self.frame.height * 0.01).active = true
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
//        directorLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        directorLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
        directorLabel.topAnchor.constraintEqualToAnchor(self.titleAndYearLabel.bottomAnchor, constant:  self.frame.height * 0.01).active = true
//        
//        writerLabel.translatesAutoresizingMaskIntoConstraints = false
////        writerLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
//        writerLabel.leftAnchor.constraintEqualToAnchor(posterView.rightAnchor).active = true
//        writerLabel.topAnchor.constraintEqualToAnchor(self.directorLabel.bottomAnchor, constant:  self.frame.height * 0.01).active = true
//        
//       actorsLabel.translatesAutoresizingMaskIntoConstraints = false
//       actorsLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
    }
    
    
    func configureFavoriteMovieCell(favoriteMovie: FavoriteMovie) {
        
        
        if let unwrappedTitle = favoriteMovie.title, unwrappedYear = favoriteMovie.year, unwrappedRated = favoriteMovie.rated, unwrappedGenre = favoriteMovie.genre, unwrappedActors = favoriteMovie.actors, unwrappedRuntime = favoriteMovie.runtime {
            
            self.titleAndYearLabel.text = "\(unwrappedTitle) (\(unwrappedYear))"
            self.ratedLabel.text = "\(unwrappedRated)"
            self.genreLabel.text = "\(unwrappedGenre)"
            self.runtimeLabel.text = "\(unwrappedRuntime)"
            self.actorsLabel.text = "\(unwrappedActors)"
            
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
             
            guard let posterData = NSData(contentsOfURL: unwrappedPosterURL) else { assertionFailure("Could not get image data"); return }
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
