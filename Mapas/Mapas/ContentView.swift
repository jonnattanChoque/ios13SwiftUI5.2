//
//  ContentView.swift
//  Mapas
//
//  Created by Jorge Maldonado Borbón on 05/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MapaView().tabItem {
                Image(systemName: "map.fill")
            }
            MapaUserView().tabItem {
                Image(systemName: "mappin.circle.fill")
            }
            MapaStoryView().tabItem {
                Image(systemName: "location.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
