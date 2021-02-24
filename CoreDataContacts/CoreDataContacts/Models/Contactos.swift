//
//  Contactos.swift
//  CoreDataContacts
//
//  Created by Jonnattan Choque on 23/02/21.
//

import Foundation
import CoreData

class Contactos: NSManagedObject, Identifiable {
    @NSManaged public var nombre: String
    @NSManaged public var apellido: String
    @NSManaged public var telefono: String
    @NSManaged public var iniciales: String
}

extension Contactos{
    static func showContacts() -> NSFetchRequest<Contactos>{
        let request : NSFetchRequest<Contactos> = Contactos.fetchRequest() as! NSFetchRequest<Contactos>
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        print("-------------------------INICIO--------------------------")
        print(request)
        print("---------------------------FIN---------------------------")
        return request
    } 
}
