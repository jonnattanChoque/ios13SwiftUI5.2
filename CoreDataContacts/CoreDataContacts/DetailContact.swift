//
//  DetailContact.swift
//  CoreDataContacts
//
//  Created by Jonnattan Choque on 23/02/21.
//

import SwiftUI

struct DetailContact: View {
    @Environment(\.presentationMode) var back
    @ObservedObject var contacto : Contactos
    
    var body: some View {
        VStack{
            Text(contacto.iniciales)
                .padding(20)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.custom("Arial", size: 100))
            Text(contacto.nombre)
                .font(.title).bold()
            Text(contacto.apellido)
                .font(.headline)
            Text("TEL: \(contacto.telefono)")
                .font(.largeTitle)
            HStack{
                Button(action: {
                    self.callContact()
                }, label: {
                    Image(systemName: "phone.fill")
                        .modifier(botonCircular(color: Color.green))
                })
                NavigationLink(
                    destination: EditContact(contactoEditar: self.contacto),
                    label: {
                        Image(systemName: "pencil")
                            .modifier(botonCircular(color: Color.blue))
                    })
            }
            Spacer()
        }
    }
    
    func callContact(){
        guard let phone = URL(string: "tel://" + self.contacto.telefono) else {return}
        UIApplication.shared.open(phone)
    }
}

struct botonCircular : ViewModifier{
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}

struct DetailContact_Previews: PreviewProvider {
    static var previews: some View {
        DetailContact(contacto: Contactos())
    }
}
