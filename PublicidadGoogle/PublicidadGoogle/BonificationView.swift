//
//  BonificationView.swift
//  PublicidadGoogle
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI
import GoogleMobileAds

struct BonificationView: View {
    @State private var video : GADRewardBasedVideoAd!
    
    var body: some View {
        Button(action:{
            if self.video.isReady {
                let root = UIApplication.shared.windows.first?.rootViewController
                self.video.present(fromRootViewController: root!)
            }else{
                print("no esta listo")
            }
        }){
            Text("Auncio aquí")
        }.onAppear{
            self.video = GADRewardBasedVideoAd()
            let request = GADRequest()
            
            self.video.load(request, withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        BonificationView()
    }
}
