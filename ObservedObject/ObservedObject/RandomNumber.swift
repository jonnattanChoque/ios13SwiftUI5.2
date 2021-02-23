//
//  RandomNumber.swift
//  ObservedObject
//
//  Created by Jhonnatan Choque on 21/02/21.
//

import Foundation
import SwiftUI
import Combine

class RandomNumber: ObservableObject {
    @Published var number: Int = 0
    @Published var contador = 0
    var timer = Timer()
    
    init() {
        iniciar()
    }
    
    func iniciar(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ (timer) in
            self.number = Int.random(in: 0...5)
        }
    }
    
    func detener(){
        self.timer.invalidate()
    }
    
    func reset(){
        self.contador = 0
    }
}
