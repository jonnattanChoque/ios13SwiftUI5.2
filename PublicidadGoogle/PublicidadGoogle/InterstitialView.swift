//
//  InterstitialView.swift
//  PublicidadGoogle
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI
import GoogleMobileAds

struct InterstitialView: View {
    @State private var interstitial : GADInterstitial!
    
    var body: some View {
        Button(action:{
            if self.interstitial.isReady{
                let root = UIApplication.shared.windows.first?.rootViewController
                self.interstitial.present(fromRootViewController: root!)
            }else{
                print("no esta listo")
            }
        }){
            Text("Anuncio Aquí")
        }.onAppear{
            self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
            let request = GADRequest()
            self.interstitial.load(request)
        }
    }
}

struct Interstitial_Previews: PreviewProvider {
    static var previews: some View {
        InterstitialView()
    }
}
