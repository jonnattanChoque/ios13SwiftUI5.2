//
//  Personas.swift
//  SyncCoreDataCloud
//
//  Created by MacBook Pro  on 18/05/21.
//

import Foundation
import CoreData

class Personas: NSManagedObject, Identifiable {
    @NSManaged public var nombre : String
    @NSManaged public var correo : String
}

extension Personas {
    static func mostrarPersonas() -> NSFetchRequest<Personas> {
        
        let request: NSFetchRequest<Personas> = Personas.fetchRequest() as! NSFetchRequest<Personas>
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        return request
        
    }
}
