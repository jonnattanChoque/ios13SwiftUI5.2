//
//  Loader.swift
//  FirebaseSwiftUI
//
//  Created by MacBook Pro  on 18/05/21.
//

import Foundation
import Firebase
import Combine

class Loader: ObservableObject {
    var didChange = PassthroughSubject<Data?, Never>()
    
    @Published var data: Data? = nil {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageUrl: String) {
        let storageImagen = Storage.storage().reference(forURL: imageUrl)
        storageImagen.getData(maxSize: 1*1024*1024) { (data, error) in
            if let error = error {
                print("Error al traer imagenes", error.localizedDescription)
            }else{
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
    }
}
