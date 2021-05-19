//
//  PostView.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct PostView: View {
    @Binding var show : Bool
    @State private var titulo = ""
    @State private var texto = ""
    
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    private func save(){
        let storage = Storage.storage().reference()
        let nombreImagen = UUID()
        let directorio = storage.child("imagenesPost/\(nombreImagen)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        directorio.putData(self.imageData, metadata: metadata){ (data, error) in
            if error == nil {
                print("Guardó imagen")
                self.show.toggle()
            }else{
                if let error = error?.localizedDescription {
                    print("Error de firebase", error)
                }else{
                    print("error local")
                }
            }
        }
        
        let db = Firestore.firestore()
        guard let email = Auth.auth().currentUser?.email else {return}
        let campos: [String: Any] = [
            "titulo": self.titulo,
            "texto": self.texto,
            "correo": email,
            "imagen": String(describing: directorio)
        ]
        
        db.collection("Post").addDocument(data: campos) { (error) in
            if let error = error {
                print("error al guardar", error.localizedDescription)
            }else{
                print("Guardo correctamente")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source),
                    isActive: self.$imagePicker,
                    label: {
                        Text("")
                    }
                ).navigationBarTitle("")
                .navigationBarHidden(true)
                HStack{
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        Text("Cancelar")
                    })
                    Spacer()
                    Button(action: {
                        self.save()
                    }, label: {
                        Text("Publicar")
                    })
                }
                TextField("Título", text: self.$titulo)
                MultiLineTextField(texto: self.$texto)
                
                if self.imageData.count != 0{
                    Image(uiImage: UIImage(data: self.imageData)!)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                }
                
                Button(action: {
                    self.mostrarMenu.toggle()
                }, label: {
                    Text("Cargar imagen")
                }).actionSheet(isPresented: self.$mostrarMenu, content: {
                    ActionSheet(title: Text("Menu"), message: Text("Selecciona una opción"), buttons: [
                        .default(Text("Camara"), action: {
                            self.source = .camera
                            self.imagePicker.toggle()
                        }),
                        .default(Text("Libreria"), action: {
                            self.source = .photoLibrary
                            self.imagePicker.toggle()
                        }),
                        .default(Text("Cancelar"))
                    ])
                })
            }.padding(.all)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(show: .constant(false))
    }
}
