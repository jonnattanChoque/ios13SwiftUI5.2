//
//  ContentView.swift
//  TraducirApp
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var alerta = false
    @State private var fecha = Date()
    @State private var image = NSLocalizedString("image", comment: "Imagen")
    
    var body: some View {
        VStack{
            Text("title")
                .padding()
            Button(action: {
                self.alerta.toggle()
            }, label: {
                Text("button")
            }).alert(isPresented: self.$alerta, content: {
                Alert(title: Text("title"), message: Text("message"), dismissButton: .default(Text("close")))
            })
            Form{
                DatePicker(selection: self.$fecha) {
                    Text("titleDate")
                }
                Text("\(self.fecha)")
            }
            
            Image("\(image)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
