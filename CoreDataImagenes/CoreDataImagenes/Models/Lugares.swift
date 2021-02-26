//
//  Lugares.swift
//  CoreDataImagenes
//
//  Created by Jonnattan Choque on 24/02/21.
//

import Foundation
import CoreData

class Lugares: NSManagedObject, Identifiable{
    @NSManaged public var nombre: String
    @NSManaged public var imagen : Data
}
