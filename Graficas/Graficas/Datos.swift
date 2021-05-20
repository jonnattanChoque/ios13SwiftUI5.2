//
//  Datos.swift
//  Graficas
//
//  Created by MacBook Pro  on 19/05/21.
//

import Foundation

struct Datos: Identifiable {
    var id = UUID()
    var cantidad : Int
    var dia : String
}

var datoDia = [
    Datos(cantidad: 50, dia: "L"),
    Datos(cantidad: 150, dia: "M"),
    Datos(cantidad: 80, dia: "MI"),
    Datos(cantidad: 90, dia: "J"),
    Datos(cantidad: 30, dia: "V")
]
var datoSemana = [
    Datos(cantidad: 10, dia: "Sem 1"),
    Datos(cantidad: 110, dia: "Sem 2"),
    Datos(cantidad: 30, dia: "Sem 3"),
    Datos(cantidad: 90, dia: "Sem 4")
]
var datoMes = [
    Datos(cantidad: 40, dia: "Ene"),
    Datos(cantidad: 180, dia: "Feb"),
    Datos(cantidad: 130, dia: "Mar")
]
