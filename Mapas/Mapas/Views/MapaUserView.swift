//
//  MapaUserView.swift
//  Mapas
//
//  Created by Jorge Maldonado Borbón on 05/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import SwiftUI
import MapKit
struct MapaUserView: View {
    
    @State private var manager = CLLocationManager()
    @State private var alert = false
    
    var body: some View {
        MapView(manager: self.$manager, alerta: self.$alert)
            .alert(isPresented: self.$alert) {
                Alert(title: Text("Necesitamos la localización para continuar..."))
        }
    }
}

struct MapaUserView_Previews: PreviewProvider {
    static var previews: some View {
        MapaUserView()
    }
}

struct MapView : UIViewRepresentable {
    
    @Binding var manager : CLLocationManager
    @Binding var alerta : Bool
    let map = MKMapView()
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(conexion: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let coordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)
        let span = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        map.region = region
        manager.requestWhenInUseAuthorization()
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate {
        var conexion : MapView
        
        init(conexion : MapView){
            self.conexion = conexion
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .denied {
                self.conexion.alerta.toggle()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let location = locations.last
            let annotation = MKPointAnnotation()
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location!) { (place, error) in
                
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }
                
                let place = place?.first?.locality
                annotation.title = place
                annotation.coordinate = location!.coordinate
                self.conexion.map.removeAnnotations(self.conexion.map.annotations)
                self.conexion.map.addAnnotation(annotation)
                let span = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
                let region = MKCoordinateRegion(center: location!.coordinate, span: span)
                self.conexion.map.region = region
                
            }
            
        }
        
    }
    
}



