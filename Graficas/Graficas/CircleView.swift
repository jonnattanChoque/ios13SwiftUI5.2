//
//  CircleView.swift
//  Graficas
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI

struct CircleView: View {
     var porcentaje : CGFloat = 0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .overlay(
                    Circle()
                        .trim(from: 0, to: self.porcentaje * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .fill(Color.white)
                ).animation(.interactiveSpring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
            Text(String(format: "%.2f", self.porcentaje))
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
