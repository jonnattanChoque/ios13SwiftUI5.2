//
//  UserList.swift
//  ApiSession
//
//  Created by Jhonnatan Choque on 2/03/21.
//

import Foundation

struct UserList: Decodable {
    var data : [UserListStruct]
}

struct UserListStruct : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}
