//
//  Users.swift
//  States
//
//  Created by Jonnattan Choque on 18/02/21.
//

import Foundation
import SwiftUI

struct Users: Identifiable {
    let id = UUID()
    let name : String
    let apellido : String
    let imagen : String
    let amigo : Bool
}
