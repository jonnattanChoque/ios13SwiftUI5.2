//
//  ContentView.swift
//  UserDefault
//
//  Created by Jonnattan Choque on 23/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var mode : ColorScheme = .light
    @State private var change : Bool!
    @State private var showButton = false
    
     var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "moon.circle")
                        .font(.title)
                    Text("Dark mode")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("ColorTexto"))
                }
                Image("logotipo")
                Button(action: {
                    self.change.toggle()
                    UserDefaults.standard.setValue(self.change, forKey: "modeDark")
                    self.changeMode()
                }, label: {
                    Text("Cambiar de modo")
                })
                if self.showButton{
                    Button(action: {
                        self.deleteMode()
                    }, label: {
                        Text("Eliminar modo oscuro")
                    })
                }
            }.navigationBarTitle("User default").onAppear(perform: {
                changeMode()
            })
        }.environment(\.colorScheme, self.mode)
    }
    
    func changeMode(){
        if(UserDefaults.standard.object(forKey: "modeDark") != nil){
            let darkMode = UserDefaults.standard.object(forKey: "modeDark") as! Bool
            if darkMode{
                self.change = true
                self.mode = .light
                self.showButton = false
            }else{
                self.showButton = true
                self.change = false
                self.mode = .dark
            }
        }else{
            self.showButton = false
            self.change = true
            self.mode = .light
        }
    }
    
    func deleteMode(){
        UserDefaults.standard.removeObject(forKey: "modeDark")
        self.changeMode()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.environment(\.colorScheme, .dark)//Forzar el modo
    }
}
