//
//  EditContact.swift
//  CoreDataContacts
//
//  Created by Jonnattan Choque on 23/02/21.
//

import SwiftUI

struct EditContact: View {
    @Environment(\.managedObjectContext) private var contexto
    @Environment(\.presentationMode) var back
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var telefono = ""
    
    @ObservedObject var contactoEditar : Contactos
    
    var body: some View {
        VStack{
            TextField("Nombre", text: self.$nombre).padding(10).onAppear{
                self.nombre = self.contactoEditar.nombre
            }
            TextField("Apellido", text: self.$apellido).padding(10).onAppear{
                self.apellido = self.contactoEditar.apellido
            }
            TextField("Teléfono", text: self.$telefono).padding(10).keyboardType(.phonePad).onAppear{
                self.telefono = self.contactoEditar.telefono
            }
            Button(action: {
                editContact()
            }, label: {
                HStack{
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .font(.title)
                    Text("Editar contacto")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }).padding(10).background(Color.blue)
            Spacer()
                .navigationBarTitle("Agregar contacto")
        }
    }
    
    func editContact(){
        let inicial = "\(String(self.nombre.first ?? "A"))\(String(self.apellido.first ?? "A"))"
        
        self.contactoEditar.nombre = self.nombre
        self.contactoEditar.apellido = self.apellido
        self.contactoEditar.telefono = self.telefono
        self.contactoEditar.iniciales = inicial
        
        do {
            try self.contexto.save()
            print("Contacto editado")
            self.back.wrappedValue.dismiss()
        } catch let error as NSError {
            print("Error al editar ", error.localizedDescription)
        }
    }
}

struct EditContact_Previews: PreviewProvider {
    static var previews: some View {
        EditContact(contactoEditar: Contactos())
    }
}
