//
//  MovieInfoViewController.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/14/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class MovieInfoViewController: UIViewController {
    
    let store = MovieDataStore.sharedInstance
    var moviePassed = Movie()
    var detailTitle = String()
    var detailPassedID = String()
    let detailPosterView = UIImageView()
    let shortPlotTextView = UITextView()
    let releasedLabel = UILabel()
    let directorLabel = UILabel()
    let writerLabel = UILabel()
    let starsLabel = UILabel()
    let imdbScoreLabel = UILabel()
    let metascoreLabel = UILabel()
    var fullPlotLinkButton = UIButton()
    let detailsStackView = UIStackView()
    let backviewForStack = UIView()
    let favoriteButton = UIButton()
//    let favoriteButton = UIBarButtonItem()
    //add to nav bar: google "add title to be listed in nav bar", back button and favorites star icon
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        allConstraints()
        
//        print("i'm the nav bar title: \(self.navigationController?.navigationItem.title)")
        
        store.getShortPlotDescriptionFromSearchWithCompletion(moviePassed) { (success) in
            print("in short plot api in detailVC")
            if success{
                
                self.configureView(self.moviePassed)
                
            }
        }
        
        self.navigationItem.title =  detailTitle.uppercaseString 
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        //        self.navigationController?.navigationItem.title = self.detailTitle
        //        self.navigationController?.navigationBar.
    }
    
    
    func setupView(){
//        self.view.backgroundColor = UIColor.cyanColor()
//        self.view.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        
       
//          favoriteButton.customView?.frame = CGRectMake(0, 0, 5, 5)
//          favoriteButton.image = UIImage(named: "favoriteStarIcon")
//          self.navigationItem.rightBarButtonItem = favoriteButton
//        
        favoriteButton.setImage(UIImage(named: "favoriteStarIcon"), forState: .Normal)
        favoriteButton.imageView?.image.
        favoriteButton.frame = CGRectMake(0, 0, 30, 30)
        favoriteButton.imageView?.backgroundColor = UIColor.clearColor()
        favoriteButton.addTarget(self, action: Selector("action"), forControlEvents: .TouchUpInside)
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(customView: favoriteButton), animated: true)
        self.navigationItem.rightBarButtonItem?.customView = favoriteButton
        
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        
        self.backviewForStack.backgroundColor = UIColor.redColor()
        // self.view.backgroundColor = UIColor(hue: <#T##CGFloat#>, saturation: <#T##CGFloat#>, brightness: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        
        detailPosterView.contentMode = .Top
        detailPosterView.clipsToBounds = true
        detailPosterView.backgroundColor = UIColor.purpleColor()
        detailPosterView.contentMode = .ScaleAspectFit
        
        shortPlotTextView.textAlignment = .Left
        shortPlotTextView.sizeToFit()
        shortPlotTextView.selectable = false
        shortPlotTextView.font = UIFont(name: "HelveticaNeue", size: 14.0)
        shortPlotTextView.backgroundColor = UIColor.magentaColor()
        shortPlotTextView.textColor = UIColor.blackColor()
        
        releasedLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        releasedLabel.numberOfLines = 0
        releasedLabel.adjustsFontSizeToFitWidth = true
        releasedLabel.sizeToFit()
        releasedLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        releasedLabel.textColor = UIColor.blackColor()
        releasedLabel.textAlignment = .Natural
        
        directorLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        directorLabel.numberOfLines = 0
        directorLabel.adjustsFontSizeToFitWidth = true
        directorLabel.sizeToFit()
        directorLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        
        writerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        writerLabel.numberOfLines = 0
        writerLabel.adjustsFontSizeToFitWidth = true
        writerLabel.sizeToFit()
        writerLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        
        starsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        starsLabel.numberOfLines = 0
        starsLabel.adjustsFontSizeToFitWidth = true
        starsLabel.sizeToFit()
        starsLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        
        imdbScoreLabel.adjustsFontSizeToFitWidth = true
        imdbScoreLabel.sizeToFit()
        imdbScoreLabel.font = UIFont(name:"HelveticaNeue", size: 14.0)
        
        metascoreLabel.adjustsFontSizeToFitWidth = true
        metascoreLabel.sizeToFit()
        metascoreLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        
        fullPlotLinkButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        fullPlotLinkButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        fullPlotLinkButton.sizeToFit()
        fullPlotLinkButton.layer.borderWidth = 1
        fullPlotLinkButton.layer.cornerRadius = 5
        fullPlotLinkButton.layer.borderColor = UIColor.blackColor().CGColor
        fullPlotLinkButton.addTarget(self, action: #selector(fullPlotButtonClicked), forControlEvents: .TouchUpInside)
        //        if self.fullPlotButtonClicked() {
        //            fullPlotLinkButton.h
        //        }
    }
    
    func allConstraints(){
        
        
        self.view.addSubview(detailPosterView)
        self.view.addSubview(shortPlotTextView)
        self.view.addSubview(backviewForStack)
        self.view.addSubview(fullPlotLinkButton)
        
        backviewForStack.translatesAutoresizingMaskIntoConstraints = false
        backviewForStack.removeConstraints(self.backviewForStack.constraints)
        backviewForStack.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        //        backviewForStack.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: view.frame.height * 0.25).active = true
        backviewForStack.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.95).active = true
        backviewForStack.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.30).active = true
        backviewForStack.topAnchor.constraintEqualToAnchor(self.shortPlotTextView.bottomAnchor, constant: view.frame.height * 0.01).active = true
        
        detailsStackView.axis = .Vertical
        detailsStackView.distribution = .Fill
        detailsStackView.alignment = .Center
        
        self.detailsStackView.addSubview(releasedLabel)
        self.detailsStackView.addSubview(directorLabel)
        self.detailsStackView.addSubview(writerLabel)
        self.detailsStackView.addSubview(starsLabel)
        self.detailsStackView.addSubview(imdbScoreLabel)
        self.detailsStackView.addSubview(metascoreLabel)
        
        self.backviewForStack.addSubview(detailsStackView)
        
        detailPosterView.translatesAutoresizingMaskIntoConstraints = false
        detailPosterView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        //        detailPosterView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        detailPosterView.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: view.frame.height * 0.077).active = true
        detailPosterView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        detailPosterView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.35).active = true
        
        shortPlotTextView.translatesAutoresizingMaskIntoConstraints = false
        shortPlotTextView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        shortPlotTextView.topAnchor.constraintEqualToAnchor(self.detailPosterView.bottomAnchor, constant: view.frame.height * 0.011).active = true
        shortPlotTextView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.12).active = true
        shortPlotTextView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.95).active = true
        
        releasedLabel.translatesAutoresizingMaskIntoConstraints = false
        releasedLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        releasedLabel.topAnchor.constraintEqualToAnchor(self.backviewForStack.topAnchor).active = true
        //        releasedLabel.topAnchor.constraintEqualToAnchor(self.shortPlotTextView.bottomAnchor, constant: view.frame.height * 0.02).active = true
        releasedLabel.leadingAnchor.constraintEqualToAnchor(self.backviewForStack.leadingAnchor).active = true
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        directorLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        directorLabel.topAnchor.constraintEqualToAnchor(self.releasedLabel.bottomAnchor, constant:  view.frame.height * 0.01).active = true
        directorLabel.leadingAnchor.constraintEqualToAnchor(self.backviewForStack.leadingAnchor).active = true
        
        writerLabel.translatesAutoresizingMaskIntoConstraints = false
        writerLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        writerLabel.topAnchor.constraintEqualToAnchor(self.directorLabel.bottomAnchor, constant:  view.frame.height * 0.01).active = true
        writerLabel.leadingAnchor.constraintEqualToAnchor(self.backviewForStack.leadingAnchor).active = true
        
        
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        starsLabel.topAnchor.constraintEqualToAnchor(self.writerLabel.bottomAnchor, constant: view.frame.height * 0.01).active = true
        starsLabel.leadingAnchor.constraintEqualToAnchor(self.detailsStackView.leadingAnchor).active = true
        
        
        imdbScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        imdbScoreLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        imdbScoreLabel.topAnchor.constraintEqualToAnchor(self.starsLabel.bottomAnchor, constant:  view.frame.height * 0.01).active = true
        imdbScoreLabel.leadingAnchor.constraintEqualToAnchor(self.backviewForStack.leadingAnchor).active = true
        
        
        metascoreLabel.translatesAutoresizingMaskIntoConstraints = false
        metascoreLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        metascoreLabel.topAnchor.constraintEqualToAnchor(self.imdbScoreLabel.bottomAnchor, constant:  view.frame.height * 0.01).active = true
        metascoreLabel.leadingAnchor.constraintEqualToAnchor(self.backviewForStack.leadingAnchor).active = true
        
        
        fullPlotLinkButton.translatesAutoresizingMaskIntoConstraints = false
        fullPlotLinkButton.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        fullPlotLinkButton.topAnchor.constraintEqualToAnchor(self.backviewForStack.bottomAnchor, constant: view.frame.height * 0.011).active = true
        fullPlotLinkButton.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.5).active = true
        fullPlotLinkButton.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.023).active = true
        
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        detailsStackView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        //        detailsStackView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        
        detailsStackView.widthAnchor.constraintEqualToAnchor(self.backviewForStack.widthAnchor).active = true
        //        detailsStackView.leadingAnchor.constraintEqualToAnchor(self.backviewForStack.leadingAnchor).active = true
    }
    
    
    func configureView(movieSelected: Movie){
        
        
        
        detailPosterView.image = UIImage(named: "no movie-icon-14032.png")
        
        NSOperationQueue.mainQueue().addOperationWithBlock({
            
        self.detailTitle = movieSelected.title
            
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
           self.title = self.detailTitle.uppercaseString
            
//            self.navigationController?.navigationItem.title = movieSelected.title
            
//            print("nav bar title is set to navbar.title\(self.navigationController?.navigationItem.title)")
//            self.navigationItem.title = self.detailTitle.uppercaseString
//              print("nav bar title is set to navItem.title: \(self.navigationItem.title)")
//            
            if  movieSelected.moviePosterURL != "N/A" {
                
                let posterURL = NSURL(string: movieSelected.moviePosterURL)
                guard let unwrappedPosterURL = posterURL else {fatalError("Could not get image URL")}
                
                guard let posterData = NSData(contentsOfURL: unwrappedPosterURL) else { assertionFailure("Could not get image data"); return }
                
                self.detailPosterView.image = UIImage(data: posterData)
                
            } else if movieSelected.moviePosterURL == "N/A" {
                self.detailPosterView.image = UIImage(named: "no movie-icon-14032.png")
            }
            
            self.shortPlotTextView.text = movieSelected.plot
            self.releasedLabel.text = "RELEASED: \(movieSelected.released)"
            self.directorLabel.text = "DIRECTOR: \(movieSelected.director)"
            self.writerLabel.text = "WRITER: \(movieSelected.writer)"
            self.starsLabel.text = "STARRING: \(movieSelected.actors)"
            self.imdbScoreLabel.text = "IMDB Score: \(movieSelected.imdbID)"
            self.metascoreLabel.text = "Metascore: \(movieSelected.metaScore)"
            self.fullPlotLinkButton.setTitle("FULL PLOT DESCRIPTION", forState: .Normal)
            
        })
        
    }
    
    func fullPlotButtonClicked() {
        
        performSegueWithIdentifier("toFullPlot", sender: self)
        print("button clicked")
    }
    
    //    func addBoldText(fullstring: String, boldPartOfString: String, font: UIFont, boldFont:  UIFont){
    //
    //        let nonBoldFontAttribute = NSFontAttributeName(font as! UIFont)
    //
    //        let boldFontAttribute = NSFontAttributeName(boldFont)
    //
    //
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC:  FullPlotViewController = segue.destinationViewController as! FullPlotViewController
        
        if segue.identifier == "toFullPlot" {
            
            destinationVC.moviePassed = moviePassed
            
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
