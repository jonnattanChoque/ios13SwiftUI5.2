//
//  BannerView.swift
//  PublicidadGoogle
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI
import GoogleMobileAds

struct BannerView: View {
    var body: some View {
        VStack{
            Text("Anuncio aqui abajo")
                .font(.title)
            Banner().frame(width: 320, height: 50)
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}


struct Banner: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        
        return banner
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
