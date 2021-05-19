//
//  Pagina3.swift
//  OnBoardingf
//
//  Created by Jonnattan Jair Choque Martinez on 19/05/21.
//

import SwiftUI

struct Pagina3: View {
    var body: some View {
        VStack{
            Text("paso 2!")
                .font(.largeTitle)
                .bold()
            Image(systemName: "tortoise.fill")
                .font(.system(size: 100))
                .foregroundColor(.red)
            Text("Esta es la última pantalla")
                .font(.system(size: 20))
        }
    }
}

struct Pagina3_Previews: PreviewProvider {
    static var previews: some View {
        Pagina3()
    }
}
