//
//  Info.swift
//  Animaciones
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI

struct Info: View {
    @Binding var show : Bool
    
    var body: some View {
        ZStack{
            Color.yellow
            VStack{
                Text("Más información")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Button(action: {
                    withAnimation{
                        self.show.toggle()
                    }
                }, label: {
                    Text("Cerrar")
                })
            }
        }
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info(show: .constant(false))
    }
}
