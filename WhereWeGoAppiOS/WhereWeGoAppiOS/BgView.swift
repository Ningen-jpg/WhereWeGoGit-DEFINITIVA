//
//  BgView.swift
//  WhereWeGoAppiOS
//
//  Created by fonztara on 11/07/22.
//

import SwiftUI

struct BgView: View {
    var bounds = UIScreen.main.bounds
    
    @State private var isBgRotating = false
    

    
    func gradient(color1: Color, color2: Color) -> LinearGradient {
        LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    
    var body: some View {
        Rectangle()
            .fill(gradient(color1: .cyan, color2: .green))
            .blur(radius: 50, opaque: true)
            .frame(width: bounds.width * 3, height: bounds.height * 2, alignment: .center)
            .edgesIgnoringSafeArea(.all)
            .rotationEffect(Angle(degrees: isBgRotating ? 360 : 0))
            .onAppear() {
                withAnimation(.linear.speed(0.03).repeatForever(autoreverses: false), {
                    isBgRotating.toggle()
                })
            }
    }
}

struct BgView_Previews: PreviewProvider {
    static var previews: some View {
        BgView()
    }
}
