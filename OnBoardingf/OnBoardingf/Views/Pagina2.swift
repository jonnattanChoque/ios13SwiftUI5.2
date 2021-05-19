//
//  Pagina2.swift
//  OnBoardingf
//
//  Created by Jonnattan Jair Choque Martinez on 19/05/21.
//

import SwiftUI

struct Pagina2: View {
    var body: some View {
        VStack{
            Text("Paso 1!")
                .font(.largeTitle)
                .bold()
            Image(systemName: "bolt.circle")
                .font(.system(size: 100))
                .foregroundColor(.red)
            Text("Descripción del paso 1")
                .font(.system(size: 20))
        }
    }
}

struct Pagina2_Previews: PreviewProvider {
    static var previews: some View {
        Pagina2()
    }
}
