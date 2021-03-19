//
//  Favorite+CoreDataProperties.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//

import Foundation
import CoreData

extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var id: Int32
    @NSManaged public var items: NSSet?
}

// MARK: Generated accessors for taks
extension Favorites {

    @objc(addTaksObject:)
    @NSManaged public func addToFavorite(_ value: MovieTable)

    @objc(removeTaksObject:)
    @NSManaged public func removeFromFavorite(_ value: MovieTable)

    @objc(addTaks:)
    @NSManaged public func addToFavorite(_ values: NSSet)

    @objc(removeTaks:)
    @NSManaged public func removeFromFavorite(_ values: NSSet)
}
