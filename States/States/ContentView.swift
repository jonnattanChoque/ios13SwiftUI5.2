//
//  ContentView.swift
//  States
//
//  Created by Jonnattan Choque on 18/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var nombre = "Pedro"
    @State private var num1 = 10
    @State private var users = [Users]()
    @State private var isFriend = false
    let num2 = 20
    
    var body: some View {
        VStack{
            Text(nombre)
            Button(action: {
                self.nombre = "Pablo"
            }, label: {
                Text("Cambiar de nombre")
            })
            Text("\(suma())")
            
            Button(action: cambiar) {
                Text("Cambiar número")
            }
            Button(action: addUsers) {
                Text("Agregar amigos")
            }
            List{
                Toggle(isOn: self.$isFriend, label: {
                    Text("Filtrar amigo")
                })
                ForEach(users.filter{$0.amigo == self.isFriend}){  user in
                    HStack{
                        Image(user.imagen)
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.title)
                                .bold()
                            Text(user.apellido)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
    }
    
    private func suma()-> Int{
        return num1 + num2
    }
    
    private func cambiar(){
        num1 = 40
    }
    
    private func addUsers(){
        self.users.append(Users(name: "John", apellido: "Choque", imagen: "user1", amigo: true))
        self.users.append(Users(name: "Juan", apellido: "Perez", imagen: "user2", amigo: true))
        self.users.append(Users(name: "Pedro", apellido: "Lopez", imagen: "user3", amigo: false))
        self.users.append(Users(name: "Luis", apellido: "Martinez", imagen: "user4", amigo: false))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
