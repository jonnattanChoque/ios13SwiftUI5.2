//
//  NetworkingManager.swift
//  AlamofireApi
//
//  Created by Jhonnatan Choque on 6/03/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

class NetworkingManager: ObservableObject {
    @Published var userList = [UserList]()
    
    init(){
        DispatchQueue.main.async {
            AF.request("https://reqres.in/api/users?page=2").responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    for item in json["data"] {
                        let id_ = item.1["id"].int ?? 0
                        let first_name_ = item.1["first_name"].string ?? ""
                        let email_ = item.1["email"].string ?? ""
                        let avatar_ = item.1["avatar"].string ?? ""
                        let users = UserList(id: id_, first_name: first_name_, email: email_, avatar: avatar_)
                        self.userList.append(users)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
