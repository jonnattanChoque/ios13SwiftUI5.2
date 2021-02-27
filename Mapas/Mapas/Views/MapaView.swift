//
//  MapaView.swift
//  Mapas
//
//  Created by Jorge Maldonado Borbón on 05/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import SwiftUI
import MapKit
struct MapaView: View {
    
    @State private var lat : Double = -38.416096
    @State private var lon : Double = -63.616673
    @State private var titulo = "Argentina"
    
    var body: some View {
        VStack{
            Mapa(lat: self.lat, lon: self.lon, titulo: self.titulo)
        }.onAppear{
            if (UserDefaults.standard.value(forKey: "latitud") != nil),
                (UserDefaults.standard.value(forKey: "longitud") != nil),
                ((UserDefaults.standard.value(forKey: "pais")) != nil){
                self.lat = UserDefaults.standard.value(forKey: "latitud") as! Double
                self.lon = UserDefaults.standard.value(forKey: "longitud") as! Double
                self.titulo = UserDefaults.standard.value(forKey: "pais") as! String
            }
        }
    }
}

struct MapaView_Previews: PreviewProvider {
    static var previews: some View {
        MapaView()
    }
}

struct Mapa : UIViewRepresentable {
    
    var lat : CLLocationDegrees
    var lon : CLLocationDegrees
    var titulo : String
    
    func makeUIView(context: UIViewRepresentableContext<Mapa>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<Mapa>) {
        let coordinate = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
        let span = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = self.titulo
        uiView.addAnnotation(annotation)
        uiView.setRegion(region, animated: true)
        
    }
    
}
