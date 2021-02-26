//
//  Save.swift
//  CoreDataImagenes
//
//  Created by Jonnattan Choque on 24/02/21.
//

import SwiftUI

struct Save: View {
    @Environment(\.managedObjectContext) var contexto
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(
                    destination: ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source),
                    isActive: self.$imagePicker,
                    label: {
                        Text("")
                    }
                ).navigationBarTitle("")
                .navigationBarHidden(true)
                
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
                
                Button(action: {
                    let nuevoLugar = Lugares(context: self.contexto)
                    nuevoLugar.nombre = "Colombia"
                    nuevoLugar.imagen = self.imageData
                    
                    do{
                        try self.contexto.save()
                        print("Guardo")
                    }catch let error as NSError{
                        print("error al guardar", error.localizedDescription)
                    }
                }, label: {
                    Text("Guardar")
                })
            }
        }
    }
}

struct Save_Previews: PreviewProvider {
    static var previews: some View {
        Save()
    }
}
