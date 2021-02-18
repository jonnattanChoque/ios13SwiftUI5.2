//
//  ContentView.swift
//  MyFirstApp
//
//  Created by Jonnattan Choque on 18/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
    @State private var showAlertSheet: Bool = false
    var alert: Alert {
        Alert(title: Text("Mi alerta"), message: Text("Soy la primera alerta"), dismissButton: .default(Text("Cerrar"), action: {
            print("cerrando")
        }))
    }
    var alertSheet: ActionSheet {
        ActionSheet(title: Text("Mi alerta"), message: Text("Soy un action Sheet"), buttons: [
            .default(Text("Primera opción"), action: {
                print("Primera opción")
            }),
            .default(Text("Segunda opción"), action: {
                print("segunda opción")
            }),
            .default(Text("Tercera opción"), action: {
                print("tercera opción")
            }),
            .cancel(Text("Cerrar"))
        ])
    }
    
    var body: some View {
        VStack(alignment: .center, spacing:30){
            Text("Curso SwiftUI")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .underline()
            Text("Bienvenidos al curso")
                .font(.subheadline)
                .foregroundColor(.green)
                .bold()
            Spacer()
            Image("imagen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200)
            Spacer()
            
            HStack(alignment: .center, spacing: 10){
                Button(action: {
                    self.showAlert.toggle()
                }, label: {
                    HStack{
                        Image(systemName: "rectangle.grid.1x2.fill")
                            .foregroundColor(.white)
                        Text("Alerta")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(.all)
                }).background(Color.blue)
                .cornerRadius(10)
                .alert(isPresented: self.$showAlert, content: {
                    self.alert
                })
                
                Button(action: {
                    self.showAlertSheet.toggle()
                }, label: {
                    HStack{
                        Image(systemName: "rectangle.grid.1x2.fill")
                            .foregroundColor(.white)
                        Text("Alerta")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(.all)
                }).background(Color.red).cornerRadius(10).actionSheet(isPresented: self.$showAlertSheet, content: {
                    self.alertSheet
                })
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
