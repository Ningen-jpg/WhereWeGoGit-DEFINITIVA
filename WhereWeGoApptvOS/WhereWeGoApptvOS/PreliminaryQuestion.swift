//
//  PreliminaryQuestion.swift
//  WhereWeGo
//
//  Created by Stefano Leva on 05/07/22.
//

import SwiftUI

struct PreliminaryQuestion: View {
    var bounds = UIScreen.main.bounds
    
    var body: some View {
        ZStack{
            VStack(spacing:200){
                Text("Domanda")
                    .foregroundColor(.black)
                    .font(.system(size: 50.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.15)
                    .background(Rectangle().fill(Color.white).cornerRadius(50))
                HStack(spacing:50){
                    Text("Risposta 1")
                        .foregroundColor(.black)
                        .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.15)
                        .font(.system(size: 50.0, design: .default))
                        .background(Rectangle().fill(Color.white).cornerRadius(50))
                    
                    Text("Risposta 2")
                        .foregroundColor(.black)
                        .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.15)
                        .font(.system(size: 50.0, design: .default))
                        .background(Rectangle().fill(Color.white).cornerRadius(50))
                }
                Spacer()
            }
        }
    }
}

struct PreliminaryQuestion_Previews: PreviewProvider {
    static var previews: some View {
        PreliminaryQuestion()
    }
}
