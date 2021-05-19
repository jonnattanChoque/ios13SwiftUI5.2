//
//  MultiLineTextField.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 18/05/21.
//

import Foundation
import SwiftUI

struct MultiLineTextField: UIViewRepresentable {
    @Binding var texto : String
    
    func makeCoordinator() -> Coordinator {
        return MultiLineTextField.Coordinator(conexion: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let texto = UITextView()
        texto.isEditable = true
        texto.isUserInteractionEnabled = true
        texto.text = "Escribe algo..."
        texto.textColor = .gray
        texto.font = .systemFont(ofSize: 15)
        texto.delegate = context.coordinator
        
        return texto
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var conexion: MultiLineTextField
        
        init(conexion: MultiLineTextField) {
            self.conexion = conexion
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.conexion.texto = textView.text
        }
    }
}
