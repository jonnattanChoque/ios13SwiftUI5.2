//
//  ContentView.swift
//  MusicPlayer
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer : AVAudioPlayer!
    @State private var play = false
    @State private var songs = ["song1", "song2", "song3"]
    @State private var albums = ["album1", "album2", "album3"]
    @State private var position = 0
    @State private var titulo = ""
    @State private var album = ""
    @State private var progress : CGFloat = 0
    
    func forward(){
        audioPlayer.stop()
        if songs.count - 1 != position{
            position += 1
            song(position: position)
            self.play = true
            audioPlayer.play()
            titulo = songs[position]
            album = albums[position]
        }
    }
    func backward(){
        audioPlayer.stop()
        if position > 0{
            position -= 1
            song(position: position)
            self.play = true
            audioPlayer.play()
            titulo = songs[position]
            album = albums[position]
        }
    }
    func song(position: Int){
        if let song = Bundle.main.path(forResource: self.songs[self.position], ofType: "wav"){
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: song))
                self.audioPlayer.prepareToPlay()
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let error as NSError {
                print("Error al reproducir", error)
            }
        }
    }
    
    var body: some View {
        ZStack{
            Color.orange.edgesIgnoringSafeArea(.all)
            VStack{
                Image(self.album)
                    .cornerRadius(10)
                Text(self.titulo)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                ZStack(alignment: .leading){
                    Capsule().fill(Color.black.opacity(0.5))
                        .frame(width: 350, height: 10)
                    Capsule().fill(Color.white.opacity(0.5))
                        .frame(width: self.progress, height: 10)
                        .gesture(
                            DragGesture()
                                .onChanged({ (valor) in
                                    let ejex = valor.location.x
                                    self.progress = ejex
                                }).onEnded({ (valor) in
                                    let ejex = valor.location.x
                                    let screen = UIScreen.main.bounds.width - 30
                                    let porcentaje = ejex / screen
                                    self.audioPlayer.currentTime = Double(porcentaje) * self.audioPlayer.duration
                                })
                        )
                }
                HStack{
                    Button(action: {
                        self.backward()
                    }, label: {
                        if self.position == 0{
                            Image(systemName: "backward.fill")
                                .modifier(botonDisabled())
                        }else{
                            Image(systemName: "backward.fill")
                                .modifier(boton())
                        }
                    })
                    Button(action: {
                        self.play.toggle()
                        if self.play{
                            self.audioPlayer.play()
                        }else{
                            self.audioPlayer.pause()
                        }
                    }, label: {
                        if self.play{
                            Image(systemName: "pause.fill")
                                .modifier(boton())
                        }else{
                            Image(systemName: "play.fill")
                                .modifier(boton())
                        }
                        
                    })
                    Button(action: {
                        self.forward()
                    }, label: {
                        if self.position == 2{
                            Image(systemName: "forward.fill")
                                .modifier(botonDisabled())
                        }else{
                            Image(systemName: "forward.fill")
                                .modifier(boton())
                        }
                    })
                }
            }
        }.onAppear{
            self.song(position: self.position)
            self.titulo = self.songs[self.position]
            self.album = self.albums[position]
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                if self.audioPlayer.isPlaying {
                    let screen = UIScreen.main.bounds.width - 30
                    let value = self.audioPlayer.currentTime / self.audioPlayer.duration
                    self.progress = screen * CGFloat(value)
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


struct boton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(15)
    }
}
struct botonDisabled: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.largeTitle)
            .padding(15)
    }
}
