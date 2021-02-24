//
//  VentanaModal.swift
//  NavigationView
//
//  Created by Jhonnatan Choque on 24/02/21.
//

import SwiftUI

struct VentanaModal: View {
    @Binding var modelo : ModelModal
    
    var body: some View {
        Text("\(self.modelo.item2)")
        TextField("Escribe tu país", text: self.$modelo.pais)
        Button(action: {
            self.modelo.modal.toggle()
        }, label: {
            Text("Enviar")
        })
    }
}

struct VentanaModal_Previews: PreviewProvider {
    static var previews: some View {
        VentanaModal(modelo: .constant(ModelModal()))
    }
}
