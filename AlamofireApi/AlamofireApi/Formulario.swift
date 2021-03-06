//
//  Formulario.swift
//  AlamofireApi
//
//  Created by Jhonnatan Choque on 6/03/21.
//

import SwiftUI

struct Formulario: View {
    @ObservedObject var login = Login()
    @State private var email = ""
    @State private var pass = ""
    
    var body: some View {
        VStack{
            TextField("Email", text: self.$email)
            SecureField("Password", text: self.$pass)
            Button(action: {
                self.login.loginDetail(email: self.email, pass: self.pass)
            }, label: {
                Text("Entrar")
            })
            
            if self.login.authenticated == 1{
                Text("Bravo")
            }else{
                Text("Error")
            }
        }
    }
}

struct Formulario_Previews: PreviewProvider {
    static var previews: some View {
        Formulario()
    }
}
