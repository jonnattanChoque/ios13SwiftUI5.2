//
//  ListaPersonas.swift
//  CrudCloudKit
//
//  Created by MacBook Pro  on 18/05/21.
//

import Foundation
import CloudKit

struct ListaPersonas: Identifiable {
    var id = UUID()
    var recordID : CKRecord.ID?
    var nombre: String
    var correo : String
}
