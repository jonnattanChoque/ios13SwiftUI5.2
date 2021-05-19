//
//  Transformaciones.swift
//  Animaciones
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI

struct Transformaciones: View {
    @State private var color = Color.blue
    @State private var radio : CGFloat = 0
    @State private var escala : CGFloat = 1
    @State private var rotacion = 0.0
    
    var body: some View {
        VStack{
            Button(action: {
                self.radio = self.radio == 0 ? 100 : 0
                self.color = self.color == Color.blue ? Color.red : Color.blue
            }, label: {
                Text("Animar")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200)
                    .background(self.color)
                    .cornerRadius(self.radio)
                    .animation(.linear(duration: 3))
                    //.animation(.interpolatingSpring(stiffness: 10, damping: 1))
            })
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Pulsar")
                    .foregroundColor(.white).font(.subheadline).bold()
                    .frame(width: 80, height: 80)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.red)
                            .scaleEffect(self.escala)
                            .opacity(Double(2 - self.escala))
                            .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
                    )
            }).onAppear{
                self.escala = CGFloat(2)
            }
            Spacer()
            Button(action: {
//                withAnimation{
//                    self.rotacion += 360
//                }
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                    self.rotacion += 360
                }
            }, label: {
                Text("Rotar")
                    .foregroundColor(.white).font(.title)
                    .frame(width: 100, height: 100)
                    .background(self.color)
                    .clipShape(Circle())
            }).rotation3DEffect(.degrees(self.rotacion),axis: (x: 0.0, y: 1.0, z: 0.0))
            Spacer()
        }
    }
}

struct Transformaciones_Previews: PreviewProvider {
    static var previews: some View {
        Transformaciones()
    }
}
