//
//  SegundaVista.swift
//  NavigationView
//
//  Created by Jhonnatan Choque on 22/02/21.
//

import SwiftUI

struct SegundaVista: View {
    var item : String
    
    var body: some View {
        Text("Segunda vista \(self.item)")
            .navigationBarTitle("Segunda vista")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: TerceraVista(),
                        label: {
                            Image(systemName: "hand.point.right.fill")
                        }
                    )
                }
            }
    }
}

struct SegundaVista_Previews: PreviewProvider {
    static var previews: some View {
        SegundaVista(item: "")
    }
}
