//
//  ListView.swift
//  CrudCloudKit
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI
import CloudKit

struct ListView: View {
    @ObservedObject var personas = Personas()
    
    var body: some View {
        VStack{
            List{
                ForEach(self.personas.personas){ item in
                    NavigationLink(destination: EditarView(persona: item)){
                        VStack(alignment: .leading){
                            Text(item.nombre)
                                .font(.subheadline)
                            Text(item.correo)
                                .font(.caption)
                        }
                    }
                }.onDelete(perform: { indexSet in
                    let persona = self.personas.personas[indexSet.first!]
                    guard let posicion = indexSet.first else {return}
                    CKContainer.default().privateCloudDatabase.delete(withRecordID: persona.recordID!) { (_, _) in
                        DispatchQueue.main.async {
                            print("Elimino")
                            self.personas.personas.remove(at: posicion)
                        }
                    }
                })
            }.navigationBarTitle("Personas", displayMode: .inline)
            .onAppear{
                self.personas.mostrar()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
