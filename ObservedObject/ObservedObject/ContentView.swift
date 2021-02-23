//
//  ContentView.swift
//  ObservedObject
//
//  Created by Jhonnatan Choque on 21/02/21.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject var number = RandomNumber()
    @EnvironmentObject var number : RandomNumber
    @State private var nombre = "Jonnatan"
    
    var body: some View {
        VStack{
            TextField("Escribe algo", text: self.$nombre)
            Text("\(self.number.number)")
                .font(.title)
                .bold()
            HStack{
                Button(action: {
                    self.number.iniciar()
                }, label: {
                    HStack{
                        Image(systemName: "play.fill").foregroundColor(.white)
                        Text("Iniciar").foregroundColor(.white).font(.headline)
                    }.padding(.all)
                }).background(Color.green)
                Button(action: {
                    self.number.detener()
                }, label: {
                    HStack{
                        Image(systemName: "stop.fill").foregroundColor(.white)
                        Text("Detener").foregroundColor(.white).font(.headline)
                    }.padding(.all)
                }).background(Color.red)
            }
            //SecondView(numberRandom: self.$number.contador)
            SecondView()
            ThreeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
