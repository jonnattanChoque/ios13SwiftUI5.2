//
//  Collection.swift
//  CoreDataImagenes
//
//  Created by Jonnattan Choque on 24/02/21.
//

import SwiftUI

struct Collection: View {
    @FetchRequest(entity: Lugares.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Lugares.nombre, ascending: true)
    ]) var lugares : FetchedResults<Lugares>
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: true){
                HStack{
                    ForEach(self.lugares, id: \.self){ lugar in
                        VStack{
                            Spacer()
                            if lugar.imagen != nil{
                                Image(uiImage: (UIImage(data: lugar.imagen) ?? UIImage(systemName: "pencil"))!)
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                    .padding(20)
                            }else{
                                Image(systemName: "pencil")
                            }
                            Text(lugar.nombre)
                                .font(.title)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct Collection_Previews: PreviewProvider {
    static var previews: some View {
        Collection()
    }
}
