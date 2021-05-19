//
//  Pagina1.swift
//  OnBoardingf
//
//  Created by Jonnattan Jair Choque Martinez on 19/05/21.
//

import SwiftUI

struct Pagina1: View {
    var body: some View {
        VStack{
            Text("Bienvenido!")
                .font(.largeTitle)
                .bold()
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundColor(.red)
            Text("Estas en la mejor app de financiamiento")
                .font(.system(size: 20))
        }
    }
}

struct Pagina1_Previews: PreviewProvider {
    static var previews: some View {
        Pagina1()
    }
}
