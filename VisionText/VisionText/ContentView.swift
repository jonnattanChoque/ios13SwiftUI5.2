//
//  ContentView.swift
//  VisionText
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    @State private var texto = ""
    
    var body: some View {
        VStack{
            Text("Reconocimiento de Texto")
            Button(action:{
                self.show = true
            }){
                Text("Escanear")
                    .foregroundColor(.white)
            }.padding(10)
            .background(Color.blue)
            .cornerRadius(5)
            Text(self.texto).lineLimit(nil)
        }.sheet(isPresented: self.$show) {
            ScannerView { textoScan in
                if let text = textoScan?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                    self.texto = text
                }
                self.show = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
