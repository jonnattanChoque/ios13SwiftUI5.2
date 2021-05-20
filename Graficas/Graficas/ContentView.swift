//
//  ContentView.swift
//  Graficas
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var picker = 0
    @State private var porcentaje: CGFloat = 0
    
    var body: some View {
        VStack{
            ZStack{
                //Color.blue
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Gráfica de barras")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Picker(selection: self.$picker, label: Text(""), content: {
                        Text("Día").tag(0)
                        Text("Semana").tag(1)
                        Text("Mes").tag(2)
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                    HStack{
                        if self.picker == 0{
                            ForEach(datoDia){ item in
                                BarView(valor: Double(item.cantidad), texto: item.dia)
                            }
                        }else if self.picker == 1 {
                            ForEach(datoSemana){ item in
                                BarView(valor: Double(item.cantidad), texto: item.dia)
                            }
                        }else{
                            ForEach(datoMes){ item in
                                BarView(valor: Double(item.cantidad), texto: item.dia)
                            }
                        }
                    }
                }
            }
            ZStack{
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Grafica circular")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    CircleView(porcentaje: self.porcentaje)
                    Button(action: {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
                            self.porcentaje += 10
                            if self.porcentaje == 100{
                                self.porcentaje = 0
                            }
                        }
                    }, label: {
                        Text("Iniciar")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                }
            }.onAppear{
                self.porcentaje = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
