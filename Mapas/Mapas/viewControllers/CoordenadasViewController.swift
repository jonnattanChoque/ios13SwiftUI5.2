//
//  CoordenadasViewController.swift
//  Mapas
//
//  Created by Jorge Maldonado Borbón on 05/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit
import CoreLocation
class CoordenadasViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var coordenadas: UILabel!
    @IBOutlet weak var pais: UITextField!
    
    var manager = CLLocationManager()
    var latitud : CLLocationDegrees!
    var longitud : CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.latitud = location.coordinate.latitude
            self.longitud = location.coordinate.longitude
        }
    }
    

    @IBAction func obtener(_ sender: UIButton) {
        self.coordenadas.text = "Lat: \(self.latitud!) Lon: \(self.longitud!)"
        UserDefaults.standard.set(self.latitud, forKey: "latitud")
        UserDefaults.standard.set(self.longitud, forKey: "longitud")
        UserDefaults.standard.set(self.pais.text, forKey: "pais")
    }
    
}
