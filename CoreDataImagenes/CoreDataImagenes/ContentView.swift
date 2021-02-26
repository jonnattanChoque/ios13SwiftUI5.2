//
//  ContentView.swift
//  CoreDataImagenes
//
//  Created by Jonnattan Choque on 24/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var posicion = 0
    
    var body: some View {
        VStack{
            Picker(selection: self.$posicion, label: Text(""), content: {
                Image(systemName: "house.fill").tag(0)
                Image(systemName: "flame.fill").tag(1)
                Image(systemName: "pencil").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
            
            if self.posicion == 0{
                Collection()
            }else if self.posicion == 1{
                Save()
            }else{
                Three()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
