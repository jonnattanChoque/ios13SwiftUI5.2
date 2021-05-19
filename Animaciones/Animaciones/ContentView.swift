//
//  ContentView.swift
//  Animaciones
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Basico().tabItem { Text("Animación básica") }
            Transformaciones().tabItem { Text("Transformaciones") }
            Escala().tabItem { Text("Escalas") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
