//
//  ContentView.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 13/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var logged = false
    
    var body: some View {
        return Group {
            if logged{
                InicioView(logged: self.$logged)
            }else{
                LoginForm(logged: self.$logged)
            }
        }.onAppear {
            if UserDefaults.standard.object(forKey: "Logged") != nil {
                self.logged = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
