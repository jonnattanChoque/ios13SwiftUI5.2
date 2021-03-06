//
//  Login.swift
//  PostApi
//
//  Created by Jhonnatan Choque on 5/03/21.
//

import Foundation
import SwiftUI
import Combine

class Login: ObservableObject {
    var didChange = PassthroughSubject<Login, Never>()
    
    @Published var authenticated = 0 {
        didSet {
            didChange.send(self)
        }
    }
    
    func loginDetail(email: String, password: String){
        guard let url = URL(string: "https://reqres.in/api/login") else {return}
        let params : [String: String] = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, response, _) in
            guard let data = data else {return}
            do{
                let datos = try JSONDecoder().decode(Respuesta.self, from: data)
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                        print(datos)
                    }
                }
            }catch{
                print("error al loguear")
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
        }.resume()
    }
}
