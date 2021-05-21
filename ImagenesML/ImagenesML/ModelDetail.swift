//
//  ModelDetail.swift
//  ImagenesML
//
//  Created by MacBook Pro  on 20/05/21.
//

import SwiftUI
import Vision
import UIKit

struct ModelDetail: View {
    let modelo : Modelos
    @State private var resultado = ""
    
    var body: some View {
        VStack{
            Image(modelo.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button(action: {
                self.clasificar(imagen: self.modelo.name)
            }, label: {
                Text("Identificar")
            })
            Text(self.resultado).font(.largeTitle)
            Spacer()
        }.navigationBarTitle(modelo.name)
    }
    
    func clasificar(imagen: String) {
        DispatchQueue.main.async {
            var VNrequest = [VNRequest]()
            let image = UIImage(named: imagen)
            
            do{
                let modelML = try VNCoreMLModel(for: MLModel(contentsOf: ClasificadorImagenes_1.urlOfModelInThisBundle))
                let clasificacion = VNCoreMLRequest(model: modelML) { (request, error) in
                    if let result = request.results as? [VNClassificationObservation] {
                        if result.first!.confidence > 0.9 {
                            self.resultado = result.first!.identifier
                        }else{
                            self.resultado = "No identificado"
                        }
                    }
                }
                VNrequest = ([clasificacion])
                let requestHandler = VNImageRequestHandler(data: (image?.pngData())!, options: [:])
                do{
                    try requestHandler.perform(VNrequest)
                }catch{
                    print("Fallo de vision", error.localizedDescription)
                }
            }catch{
                print("Fallo del modelo", error.localizedDescription)
            }
        }
    }
}

struct ModelDetail_Previews: PreviewProvider {
    static var previews: some View {
        ModelDetail(modelo: testModelo[0])
    }
}
