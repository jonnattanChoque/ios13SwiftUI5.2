//
//  ContentView.swift
//  SyncCoreDataCloud
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(fetchRequest: Personas.mostrarPersonas()) var personas:FetchedResults<Personas>
    @Environment(\.managedObjectContext) var contexto
    @State private var nombre = ""
    @State private var correo = ""
    
    private func guardar(){
        let nuevaPersona = Personas(context: self.contexto)
        nuevaPersona.nombre = self.nombre
        nuevaPersona.correo = self.correo
        
        do {
            try self.contexto.save()
            print("Guardo contacto")
            self.nombre = ""
            self.correo = ""
        } catch let error as NSError {
            print("Error al guardar", error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section(header: Text("Campos")) {
                        TextField("nombre", text: self.$nombre)
                        TextField("correo", text: self.$correo)
                        Button(action:{
                            self.guardar()
                        }){
                            Text("Guardar")
                        }
                    }
                    Section(header: Text("Mostar datos")){
                        ForEach(self.personas){ item in
                            Text(item.nombre)
                        }.onDelete { (index) in
                            let borrarPersona = self.personas[index.first!]
                            self.contexto.delete(borrarPersona)
                            
                            do{
                                try self.contexto.save()
                            }catch let error as NSError {
                                print("No borro", error.localizedDescription)
                            }
                        }
                    }
                    
                }.navigationBarTitle("CoreData/CloudKit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
