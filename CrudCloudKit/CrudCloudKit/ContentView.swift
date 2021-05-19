//
//  ContentView.swift
//  CrudCloudKit
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI
import CloudKit

struct ContentView: View {
    @State private var nombre = ""
    @State private var correo = ""
    @ObservedObject var personas = Personas()
    
    private func save(){
        let record = CKRecord(recordType: "Personas")
        record.setValue(self.nombre, forKey: "nombre")
        record.setValue(self.correo, forKey: "correo")
        
        let privateDB = CKContainer.default().privateCloudDatabase
        privateDB.save(record) { (_, error) in
            if error != nil {
                print("Error en iCloud", error?.localizedDescription)
            }
            
            print("Guardo")
            self.nombre = ""
            self.correo = ""
        }
    }
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Campos")) {
                    TextField("Nombre", text: self.$nombre)
                    TextField("Corre", text: self.$correo)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                Section(header: Text("Guardar registros")) {
                    Button(action: {
                        self.save()
                    }, label: {
                        Text("Guardar")
                    })
                }
                Section{
                    NavigationLink(
                        destination:
                        ListView(),
                        label: {
                            Text("Ver personas")
                        })
                }.navigationBarTitle("IcloudKit", displayMode: .inline)
                .onAppear{
                    self.personas.personas = []
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
