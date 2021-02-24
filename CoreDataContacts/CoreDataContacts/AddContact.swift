//
//  AddContact.swift
//  CoreDataContacts
//
//  Created by Jonnattan Choque on 23/02/21.
//

import SwiftUI

struct AddContact: View {
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var back
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var telefono = ""
    
    var body: some View {
        VStack{
            TextField("Nombre", text: self.$nombre).padding(10)
            TextField("Apellido", text: self.$apellido).padding(10)
            TextField("Teléfono", text: self.$telefono).padding(10).keyboardType(.phonePad)
            Button(action: {
                addContact()
            }, label: {
                HStack{
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.white)
                        .font(.title)
                    Text("Guardar contacto")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }).padding(10).background(Color.blue)
            Spacer()
                .navigationBarTitle("Agregar contacto")
        }
    }
    
    func addContact(){
        let newContact = Contactos(context: self.contexto)
        let inicial = "\(String(self.nombre.first ?? "A"))\(String(self.apellido.first ?? "A"))"
        
        newContact.nombre = self.nombre
        newContact.apellido = self.apellido
        newContact.telefono = self.telefono
        newContact.iniciales = inicial
        
        do {
            try self.contexto.save()
            print("Contacto guardado")
            self.back.wrappedValue.dismiss()
        } catch let error as NSError {
            print("Error al guardar ", error.localizedDescription)
        }
    }
}

struct AddContact_Previews: PreviewProvider {
    static var previews: some View {
        AddContact()
    }
}
