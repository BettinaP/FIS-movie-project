//
//  FullPlotViewController.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 9/27/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class FullPlotViewController: UIViewController {
    
    
    
    let store = MovieDataStore.sharedInstance
    var moviePassed = Movie()
    let fullPlotTextView = UITextView()
    let plotSummaryLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        plotSummaryLabel.sizeToFit()
        plotSummaryLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        plotSummaryLabel.textColor = UIColor.blackColor()
        plotSummaryLabel.text = "PLOT SUMMARY"
        self.view.addSubview(plotSummaryLabel)
        
        fullPlotTextView.textAlignment = .Natural
        fullPlotTextView.selectable = false
        fullPlotTextView.font = UIFont(name: "Arial", size: 16.0)
        fullPlotTextView.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        fullPlotTextView.textColor = UIColor.blackColor()
        fullPlotTextView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        
        
        self.view.addSubview(fullPlotTextView)
        
        plotSummaryLabel.translatesAutoresizingMaskIntoConstraints = false
        plotSummaryLabel.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: (view.frame.height * 0.11)).active = true
        plotSummaryLabel.leadingAnchor.constraintEqualToAnchor(self.fullPlotTextView.leadingAnchor).active = true
        plotSummaryLabel.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.03).active = true
        plotSummaryLabel.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.5).active = true
        
        fullPlotTextView.translatesAutoresizingMaskIntoConstraints = false
        fullPlotTextView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        fullPlotTextView.topAnchor.constraintEqualToAnchor(self.plotSummaryLabel.bottomAnchor, constant: view.frame.height * 0.015).active = true
        fullPlotTextView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.30).active = true
        fullPlotTextView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.85).active = true
        
        
        self.view.backgroundColor = UIColor.magentaColor()
        
        store.getFullPlotDescriptionFromSearchWithCompletion(moviePassed) { (success) in
            if success {
                
                NSOperationQueue.mainQueue().addOperationWithBlock({
                    self.fullPlotTextView.text = self.moviePassed.plot
                })
                
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
