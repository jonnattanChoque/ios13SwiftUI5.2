//
//  ScannerView.swift
//  VisionText
//
//  Created by MacBook Pro  on 19/05/21.
//

import Foundation
import UIKit
import SwiftUI
import Vision
import VisionKit

struct ScannerView: UIViewControllerRepresentable {
    let completionHandler : ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void){
        self.completionHandler = completion
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ScannerView>) {
        
    }
    
    func makeCoordinator() -> ScannerView.Coordinator {
        return Coordinator(completion: completionHandler)
    }
    
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        let completionHandler: ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void){
            self.completionHandler = completion
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizerText(completionHandler: completionHandler)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Error al escanear imagen", error)
            completionHandler(nil)
        }
        
    }
    
    
}
