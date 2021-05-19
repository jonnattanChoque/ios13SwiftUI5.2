//
//  LoginForm.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 13/05/21.
//

import SwiftUI
import Firebase

struct LoginForm: View {
    @State private var email = ""
    @State private var pass = ""
    @Binding var logged : Bool
    
    var body: some View {
        VStack{
            Text("Inicio de sesion")
                .font(.title)
            TextField("Email", text: self.$email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("Password", text: self.$pass)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                Auth.auth().signIn(withEmail: self.email, password: self.pass) { (user, error) in
                    if(user != nil){
                        self.logged = true
                        UserDefaults.standard.set(true, forKey: "Logged")
                    }else{
                        if let error = error?.localizedDescription {
                            print("Error firebase: ", error)
                        }else {
                            print("Error de código: ")
                        }
                    }
                }
            }, label: {
                Text("Entrar")
            })
            Button(action: {
                Auth.auth().createUser(withEmail: self.email, password: self.pass) { (user, error) in
                    if(user != nil){
                        
                    }else{
                        if let error = error?.localizedDescription {
                            print("Error firebase: ", error)
                        }else {
                            print("Error de código: ")
                        }
                    }
                }
            }, label: {
                Text("Registrarse")
            })
        }.padding(.all)
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(logged: .constant(false))
    }
}
