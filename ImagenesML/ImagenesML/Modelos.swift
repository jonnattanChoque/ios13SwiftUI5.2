//
//  Modelos.swift
//  ImagenesML
//
//  Created by MacBook Pro  on 20/05/21.
//

import Foundation

struct Modelos : Identifiable {
    var id = UUID()
    var name : String
}

let testModelo = [
    Modelos(name: "auto"),
    Modelos(name: "ducati"),
    Modelos(name: "flor1"),
    Modelos(name: "flor2"),
    Modelos(name: "ford"),
    Modelos(name: "paisaje"),
    Modelos(name: "persona"),
    Modelos(name: "personas"),
]
