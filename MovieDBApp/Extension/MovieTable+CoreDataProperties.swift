//
//  MovieTable+CoreDataProperties.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//

import Foundation
import CoreData

extension MovieTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieTable> {
        return NSFetchRequest<MovieTable>(entityName: "MovieTable")
    }

    @NSManaged public var imagePath: String?
    @NSManaged public var id: Int32
    @NSManaged public var releaseDate: String?
    @NSManaged public var overview: String?
    @NSManaged public var title: String?
}
