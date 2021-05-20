//
//  ContentView.swift
//  Mensajes
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Mensajes().tabItem {
                Image(systemName: "message.fill")
            }
            Correos().tabItem {
                Image(systemName: "mail.fill")
            }
        }
    }
}

extension UIApplication {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
