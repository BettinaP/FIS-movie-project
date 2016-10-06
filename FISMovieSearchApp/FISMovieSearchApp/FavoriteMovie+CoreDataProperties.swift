//
//  FavoriteMovie+CoreDataProperties.swift
//  FISMovieSearchApp
//
//  Created by Bettina on 10/3/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavoriteMovie {

    @NSManaged var title: String?
    @NSManaged var releaseDate: String?
    @NSManaged var director: String?
    @NSManaged var writer: String?
    @NSManaged var actors: String?
    @NSManaged var posterURL: String?
    @NSManaged var imdbID: String?
    @NSManaged var type: String?
    @NSManaged var year: String?
    @NSManaged var runtime: String?
    @NSManaged var rated: String?
    @NSManaged var genre: String?
    @NSManaged var plot: String?
    @NSManaged var language: String?
    @NSManaged var awards: String?
    @NSManaged var imdbRating: String?
    @NSManaged var metaScore: String?
    @NSManaged var response: String?

}
