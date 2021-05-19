//
//  GetData.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 18/05/21.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class GetData: ObservableObject {
    @Published var datos = [Modelo]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("Post").addSnapshotListener { (query, error) in
            if let error = error {
                print("Error al consultar datos", error.localizedDescription)
            }else {
                self.datos.removeAll()
                for docment in query!.documents {
                    let valor = docment.data()
                    let id = docment.documentID
                    let titulo = valor["titulo"] as? String ?? "Sin título"
                    let texto = valor["texto"]   as? String ?? "Sin texto"
                    let correo = valor["correo"] as? String ?? "Sin correo"
                    let imagen = valor["imagen"] as? String ?? "Sin imagen"
                    
                    DispatchQueue.main.async {
                        let model = Modelo(id: id, titulo: titulo, texto: texto, correo: correo, imagen: imagen)
                        self.datos.append(model)
                    }
                }
            }
        }
    }
}
