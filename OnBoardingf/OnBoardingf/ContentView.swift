//
//  ContentView.swift
//  OnBoardingf
//
//  Created by Jonnattan Jair Choque Martinez on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var paginaActual = 0
    @State private var saltar = false
    
    var body: some View {
        return Group{
            if self.saltar{
                InicioView()
            }else{
                VStack {
                    ZStack {
                        SwipeGesture(paginaActual: self.$paginaActual)
                        if self.paginaActual == 0{
                            Pagina1()
                        }else if self.paginaActual == 1 {
                            Pagina2()
                        }else{
                            Pagina3()
                        }
                    }
                    PageControl(paginaActual: paginaActual)
                    HStack {
                        Button(action: {
                            if self.paginaActual != 0{
                                self.paginaActual -= 1
                            }
                        }, label: {
                            Image(systemName: "chevron.left.circle")
                                .foregroundColor(.blue)
                                .font(.title)
                        })
                        Button(action: {
                            if self.paginaActual < 3{
                                self.paginaActual += 1
                            }
                        }, label: {
                            Image(systemName: "chevron.right.circle")
                                .foregroundColor(.blue)
                                .font(.title)
                        })
                    }
                    if self.paginaActual == 2{
                        Button(action: {
                            self.saltar.toggle()
                            UserDefaults.standard.set(true, forKey: "saltar")
                        }, label: {
                            Text("Entendido")
                        })
                    }
                }.padding(.all)
                .animation(.default)
            }
        }.onAppear{
            if UserDefaults.standard.object(forKey: "saltar") != nil{
                self.saltar = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct PageControl: UIViewRepresentable {
    var paginaActual = 0
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        let pagina = UIPageControl()
        pagina.currentPageIndicatorTintColor = .blue
        pagina.pageIndicatorTintColor = .darkGray
        pagina.numberOfPages = 3
        
        return pagina
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = paginaActual
    }
}

struct SwipeGesture: UIViewRepresentable {
    
    @Binding var paginaActual : Int
    
    func makeCoordinator() -> Coordinator {
        return SwipeGesture.Coordinator(conexion: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SwipeGesture>) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let izq = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.izq))
        izq.direction = .left
        let der = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.der))
        der.direction = .right
        
        view.addGestureRecognizer(izq)
        view.addGestureRecognizer(der)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SwipeGesture>) {
        
    }
    
    class Coordinator: NSObject {
        var conexion : SwipeGesture
        
        init(conexion: SwipeGesture) {
            self.conexion = conexion
        }
        
        @objc func der(){
            print(self.conexion.paginaActual)
            if self.conexion.paginaActual != 0{
                self.conexion.paginaActual -= 1
            }
        }
        @objc func izq(){
            print(self.conexion.paginaActual)
            if self.conexion.paginaActual < 3{
                self.conexion.paginaActual += 1
            }
        }
    }
}
