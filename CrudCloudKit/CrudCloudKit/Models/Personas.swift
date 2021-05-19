//
//  Personas.swift
//  CrudCloudKit
//
//  Created by MacBook Pro  on 18/05/21.
//

import Foundation
import Combine
import CloudKit

class Personas: ObservableObject {
    var didChange = PassthroughSubject<Personas, Never>()
    
    @Published var personas = [ListaPersonas](){
        didSet{
            didChange.send(self)
        }
    }
    
    func mostrar() {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: true)
        let query = CKQuery(recordType: "Personas", predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["nombre", "correo"]
        operation.resultsLimit = 50
        self.personas = []
        operation.recordFetchedBlock = {record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                guard let nombre = record["nombre"] as? String else {return}
                guard let correo = record["correo"] as? String else {return}
                let lista = ListaPersonas(recordID: recordID, nombre: nombre, correo: correo)
                self.personas.append(lista)
            }
        }
        CKContainer.default().privateCloudDatabase.add(operation)
    }
}
