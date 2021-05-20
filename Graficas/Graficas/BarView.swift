//
//  BarView.swift
//  Graficas
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct BarView: View {
    @State private var barra = 0
    var valor : Double = 150
    var texto : String = ""
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(.gray)
                Capsule().frame(width: 30, height: CGFloat(self.barra))
                    .animation(.default)
                    .foregroundColor(.white)
            }
            Text(texto)
        }.onAppear{
            self.barra = Int(Double(self.barra) + self.valor)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}
