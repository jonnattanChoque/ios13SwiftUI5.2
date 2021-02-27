//
//  MapaStoryView.swift
//  Mapas
//
//  Created by Jorge Maldonado Borbón on 05/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import SwiftUI

struct MapaStoryView: View {
    var body: some View {
        mapaStoryboard()
    }
}

struct MapaStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MapaStoryView()
    }
}

struct mapaStoryboard : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<mapaStoryboard>) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "mapasStory", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Inicio")
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<mapaStoryboard>) {
        
    }
}
