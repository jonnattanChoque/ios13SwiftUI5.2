//
//  SecondView.swift
//  ObservedObject
//
//  Created by Jhonnatan Choque on 21/02/21.
//

import SwiftUI

struct SecondView: View {
    //@Binding var numberRandom : Int
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
        }).background(Color.blue)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        //SecondView(numberRandom: .constant(0))
        SecondView()
    }
}
