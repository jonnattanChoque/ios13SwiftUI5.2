//
//  ContentView.swift
//  LoginRedes
//
//  Created by MacBook Pro  on 22/05/21.
//

import SwiftUI
import Firebase
import FBSDKLoginKit

struct ContentView: View {
    @State private var show = false
    
    var body: some View {
        VStack{
            LoginFace(show: self.$show)
                .frame(width: 200, height: 50)
            if show{
                Text("Logueado")
            }else{
                Text("No logueado")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoginFace: UIViewRepresentable {
    @Binding var show : Bool
    
    func makeCoordinator() -> Coordinator {
        return LoginFace.Coordinator(conexion: self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let button = FBLoginButton()
        button.permissions = ["email", "public_profile"]
        
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        var conexion : LoginFace
        
        init(conexion: LoginFace) {
            self.conexion = conexion
        }
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil {
                print((error?.localizedDescription)!)
            }
            
            if AccessToken.current != nil {
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential) { (success, error) in
                    if error != nil {
                        print((error?.localizedDescription)!)
                    }
                    print("logueado")
                    self.conexion.show = true
                    print(Auth.auth().currentUser?.displayName as Any)
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            do {
                try Auth.auth().signOut()
                self.conexion.show = false
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
