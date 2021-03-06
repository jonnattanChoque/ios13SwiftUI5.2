//
//  ContentView.swift
//  PostApi
//
//  Created by Jhonnatan Choque on 5/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var pass = ""
    @ObservedObject var manager = Login()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Email")
            TextField("Escribe tu email", text: self.$email)
            Text("Password")
            TextField("Escribe tu contraseña", text: self.$pass)
            Button(action: {
                self.manager.loginDetail(email: self.email, password: self.pass)
            }, label: {
                Text("EntrarA")
            })
            
            if self.manager.authenticated == 1{
                Text("Te logeaste 😀")
            }else if self.manager.authenticated == 2{
                Text("no pudiste entrar 😔")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
