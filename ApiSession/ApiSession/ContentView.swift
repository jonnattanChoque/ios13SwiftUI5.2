//
//  ContentView.swift
//  ApiSession
//
//  Created by Jhonnatan Choque on 2/03/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkingManager()
    
    var body: some View {
        NavigationView{
            List(self.networkManager.userList.data, id: \.id){ user in
                HStack{
                    ImageView(imageUrl: user.avatar)
                        .frame(width: 100, height: 100)
                        .clipped()
                    VStack(alignment: .leading){
                        Text(user.first_name)
                            .font(.title)
                            .bold()
                        Text(user.email)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader : ImageLoader
    
    init(imageUrl: String){
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View{
        Image(uiImage: ((imageLoader.data.count == 0) ? UIImage(systemName: "photo"): UIImage(data: imageLoader.data))!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
