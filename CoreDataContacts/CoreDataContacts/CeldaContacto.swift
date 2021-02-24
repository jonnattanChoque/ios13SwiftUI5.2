//
//  CeldaContacto.swift
//  CoreDataContacts
//
//  Created by Jonnattan Choque on 23/02/21.
//

import SwiftUI

struct CeldaContacto: View {
    @ObservedObject var contacto : Contactos
    
    var body: some View {
        HStack{
            Text(contacto.iniciales)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            VStack(alignment: .leading){
                Text(contacto.nombre)
                    .font(.title)
                    .bold()
                Text(contacto.apellido)
                    .font(.headline)
                Text(contacto.telefono)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct CeldaContacto_Previews: PreviewProvider {
    static var previews: some View {
        CeldaContacto(contacto: Contactos())
    }
}
