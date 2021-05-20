//
//  ContentView.swift
//  PublicidadGoogle
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            BannerView().tabItem {
                Text("Banner")
            }
            BonificationView().tabItem {
                Text("BonificationView")
            }
            InterstitialView().tabItem {
                Text("Interstitial")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
