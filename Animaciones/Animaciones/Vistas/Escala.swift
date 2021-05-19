//
//  Escala.swift
//  Animaciones
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI

struct Escala: View {
    @State private var show = false
    
    var body: some View {
        ZStack{
            Button(action: {
                withAnimation{
                    self.show.toggle()
                }
            }, label: {
                Text("Ver más...")
            })
            
            if self.show {
                Info(show: self.$show).transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct Escala_Previews: PreviewProvider {
    static var previews: some View {
        Escala()
    }
}
