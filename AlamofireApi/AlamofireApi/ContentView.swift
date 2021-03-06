//
//  ContentView.swift
//  AlamofireApi
//
//  Created by Jhonnatan Choque on 6/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var manager = NetworkingManager()
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(
                    destination: Formulario(),
                    label: {
                        Text("Login")
                    })
                List(self.manager.userList){ user in
                    HStack{
                        AnimatedImage(url: URL(string: user.avatar))
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text(user.first_name)
                                .font(.title)
                                .bold()
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }.navigationTitle("Alamofire")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
