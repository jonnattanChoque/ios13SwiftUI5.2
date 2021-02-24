//
//  ContentView.swift
//  CoreDataContacts
//
//  Created by Jonnattan Choque on 23/02/21.
//

import SwiftUI

struct ContentView: View {
    
    //@FetchRequest(fetchRequest: Contactos.showContacts()) var contactos: FetchedResults<Contactos>
    @Environment(\.managedObjectContext) var contexto
    @FetchRequest(entity: Contactos.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Contactos.nombre, ascending: true)
    ]) var contactos : FetchedResults<Contactos>
    
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(self.contactos){  contacto in
                        NavigationLink(destination: DetailContact(contacto: contacto)) {
                            CeldaContacto(contacto: contacto)
                        }
                    }.onDelete(perform: { indexSet in
                        let contactDelete = self.contactos[indexSet.first!]
                        self.deleteContact(contact: contactDelete)
                    })
                }
                NavigationLink(
                    destination: AddContact(),
                    label: {
                        Spacer()
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Agregar contacto")
                            .foregroundColor(.white)
                            .font(.title)
                        Spacer()
                    }
                ).padding(10)
                .background(Color.green)
                .navigationBarTitle("Contactos", displayMode: .inline)
                .navigationBarItems(leading: EditButton())
            }
        }
    }
    
    func deleteContact(contact: Contactos){
        self.contexto.delete(contact)
        do {
            try self.contexto.save()
        } catch let error as NSError {
            print("Error al borrar", error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
