//
//  ContentView.swift
//  ImagenesML
//
//  Created by MacBook Pro  on 20/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(testModelo) { item in
                NavigationLink(
                    destination: ModelDetail(modelo: item),
                    label: {
                        HStack{
                            Image(item.name)
                                .resizable()
                                .frame(width: 100, height: 50)
                            Text(item.name)
                        }
                    }
                )
            }.navigationBarTitle("Clasificador")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
