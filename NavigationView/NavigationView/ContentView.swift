//
//  ContentView.swift
//  NavigationView
//
//  Created by Jhonnatan Choque on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var texto = ""
    @State private var modelo = ModelModal()
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Escribe algo", text: self.$texto)
                    .padding(20)
                NavigationLink(
                    destination: SegundaVista(item: self.texto),
                    label: {
                        HStack{
                            Image(systemName: "hand.point.right.fill")
                                .foregroundColor(.white)
                            Text("Ir a la segunda vista")
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding(.all).background(Color.red)
                    }
                ).navigationBarTitle("Principal", displayMode: .inline)
                Button(action: {
                    self.modelo.modal.toggle()
                }, label: {
                    Text("Ventana modal")
                }).sheet(isPresented: self.$modelo.modal, content: {
                    VentanaModal(modelo: self.$modelo)
                })
                Text("Tu país es: \(self.modelo.pais)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
