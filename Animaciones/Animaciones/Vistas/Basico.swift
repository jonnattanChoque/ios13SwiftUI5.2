//
//  Basico.swift
//  Animaciones
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI

struct Basico: View {
    @State private var show = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Text("Mostrar").font(.largeTitle)
                })
                Image(systemName: "chevron.up.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(self.show ? 0 : 180))
                    .animation(.easeIn)
            }
            if self.show {
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .transition(.move(edge: .top))
                    .animation(.interpolatingSpring(mass: 2.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
            }
            Spacer()
        }.padding(.all)
    }
}

struct Basico_Previews: PreviewProvider {
    static var previews: some View {
        Basico()
    }
}
