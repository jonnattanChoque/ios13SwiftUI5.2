//
//  ContentView.swift
//  GridApp
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI
import QGrid

struct ContentView: View {
    @State private var buscar = ""
    @State private var alturaVista : CGFloat = 0
    
    var body: some View {
        VStack {
            SearchBar(text: self.$buscar)
            QGrid(imagenes.filter{
                self.buscar.isEmpty ? true : $0.nombre.lowercased().contains(self.buscar.lowercased())
            }, columns: 3) { item in
                Celda(imagen: item.imagen, nombre: item.nombre)
            }
        }.padding()
        .offset(y: -self.alturaVista)
        .animation(.spring())
        .onAppear{
//            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
//                let valor = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
//                let altura = valor.height
//                self.alturaVista = altura
//            }
//            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
//                self.alturaVista = 0
//            }
        }
    }
}

struct Celda: View {
    var imagen : String
    var nombre : String
    
    var body: some View {
        VStack {
            Image(systemName: imagen)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
            Text(nombre)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
