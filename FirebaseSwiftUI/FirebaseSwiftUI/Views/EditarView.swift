//
//  EditarView.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct EditarView: View {
    var post : Modelo
    @State private var titulo = ""
    @State private var texto = ""
    @Environment(\.presentationMode) var atras
    
    private func Editar() {
        let db = Firestore.firestore()
        let id = self.post.id
        let campos : [String: Any] = ["titulo": self.titulo]
        
        db.collection("Post").document(id).updateData(campos) { (error) in
            if let error = error {
                print("Error al actualizar", error.localizedDescription)
            }else{
                print("Post actualizado")
                self.atras.wrappedValue.dismiss()
            }
        }
    }
    var body: some View {
        VStack {
            TextField("Título", text: self.$titulo)
                .onAppear{
                    self.titulo = self.post.titulo
                }
            Button(action: {
                self.Editar()
            }, label: {
                Text("Editar")
            })
        }
    }
}

struct EditarView_Previews: PreviewProvider {
    static var previews: some View {
        EditarView(post: Modelo(id: "", titulo: "", texto: "", correo: "", imagen: ""))
    }
}
