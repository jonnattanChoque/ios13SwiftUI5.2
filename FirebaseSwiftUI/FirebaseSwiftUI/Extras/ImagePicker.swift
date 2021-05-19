//
//  ImagePicker.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var show: Bool
    @Binding var image : Data
    var source : UIImagePickerController.SourceType
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(conexion: self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.allowsEditing = true
        controller.delegate = context.coordinator
        
        return controller
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var conexion : ImagePicker
        
        init(conexion: ImagePicker){
            self.conexion = conexion
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.conexion.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let data = image.jpegData(compressionQuality: 0.100)
            self.conexion.image = data!
            self.conexion.show.toggle()
        }
    }
}
