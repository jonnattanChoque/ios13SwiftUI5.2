//
//  ThreeView.swift
//  ObservedObject
//
//  Created by Jhonnatan Choque on 21/02/21.
//

import SwiftUI

struct ThreeView: View {
    @EnvironmentObject var num : RandomNumber
    var body: some View {
        Text("Segunda vista")
        Button(action: {
            //self.numberRandom += 1
            self.num.contador += 1
        }, label: {
            HStack{
                Image(systemName: "play").foregroundColor(.white)
                //Text("Contador = \(self.numberRandom)")
                Text("Contador = \(self.num.contador)")
                    .foregroundColor(.white)
                    .font(.headline)
            }.padding(.all)
        }).background(Color.gray)
        
        Button(action: {
            self.num.reset()
        }, label: {
            HStack{
                Image(systemName: "stop").foregroundColor(.white)
                //Text("Contador = \(self.numberRandom)")
                Text("Detener contador")
                    .foregroundColor(.white)
                    .font(.headline)
            }.padding(.all)
        }).background(Color.red)
    }
}

struct ThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeView()
    }
}
