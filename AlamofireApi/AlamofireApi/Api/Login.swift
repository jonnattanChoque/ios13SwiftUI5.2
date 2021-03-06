//
//  Login.swift
//  AlamofireApi
//
//  Created by Jhonnatan Choque on 6/03/21.
//

import Foundation
import Alamofire
import Combine

class Login: ObservableObject {
    @Published var authenticated = 0
    
    func loginDetail(email: String, pass: String) {
        let params : Parameters = [
            "email": email,
            "password": pass
        ]
        
        guard let url = URL(string: "https://reqres.in/api/login") else {return}
        
        DispatchQueue.main.async {
            AF.request(url, method: .post, parameters: params).responseJSON { (response) in
                switch response.result{
                case .success(let value):
                    let json = value as! NSDictionary
                    if(json.value(forKey: "token") != nil){
                        self.authenticated = 1
                    }else if (json.value(forKey: "error") != nil){
                        self.authenticated = 2
                    }
                case .failure(_):
                    print("e")
                }
            }
        }
    }
}
