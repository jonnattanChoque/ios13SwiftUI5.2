//
//  TextRecognizer.swift
//  VisionText
//
//  Created by MacBook Pro  on 19/05/21.
//

import Foundation
import Vision
import VisionKit

class TextRecognizer{
    let cameraScan : VNDocumentCameraScan
    
    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }
    
    func recognizerText(completionHandler: @escaping([String]) -> Void) {
        DispatchQueue.main.async {
            let images = (0..<self.cameraScan.pageCount).compactMap({self.cameraScan.imageOfPage(at: $0).cgImage})
            let imagesRequest = images.map({(image: $0, request: VNRecognizeTextRequest())})
            let textScanned = imagesRequest.map{ image, request -> String in
                let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
                do{
                    try requestHandler.perform([request])
                    guard let observation = request.results as? [VNRecognizedTextObservation] else {return ""}
                    return observation.compactMap({$0.topCandidates(1).first?.string}).joined(separator: "\n")
                }catch let error as NSError{
                    print("ERROR: ", error.localizedDescription)
                    return ""
                }
            }
            completionHandler(textScanned)
        }
    }
}
