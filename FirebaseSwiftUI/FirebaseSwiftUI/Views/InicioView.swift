//
//  InicioView.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 13/05/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct InicioView: View {
    @Binding var logged : Bool
    @State var show = false
    @ObservedObject var data = GetData()
    
    var body: some View {
        NavigationView {
            ZStack {
                List{
                    ForEach(self.data.datos) { item in
                        NavigationLink(
                            destination: EditarView(post: item),
                            label: {
                                VStack (alignment: .leading){
                                    Text(item.titulo).font(.title).bold()
                                    Text(item.texto)
                                    imagenFirebase(imageUrl: item.imagen)
                                }
                            })
                    }.onDelete(perform: { indexSet in
                        let id = self.data.datos[indexSet.first!].id
                        let db = Firestore.firestore()
                        db.collection("Post").document(id).delete()
                        self.data.datos.remove(atOffsets: indexSet)
                    })
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding()
                        })
                    }
                }
            }.navigationBarTitle("Inicio", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.removeObject(forKey: "Logged")
                    self.logged = false
                }, label: {
                    Text("Salir")
                })
            )
        }.sheet(isPresented: self.$show, content: {
            PostView(show: self.$show)
        })
    }
}

struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView(logged: .constant(false))
    }
}
