//
//  SearchBar.swift
//  GridApp
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import Foundation
import SwiftUI

struct SearchBar : UIViewRepresentable {
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: self.$text)
    }
    
    @Binding var text : String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text : String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
