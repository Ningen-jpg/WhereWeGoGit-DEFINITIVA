//
//  InitialView.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 06/07/22.
//

import SwiftUI

struct InitialView: View {
    var bounds = UIScreen.main.bounds
    @Binding var viewNumber: Int
    

    var body: some View {
        ZStack{
            PlayerView(video: "Mare")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                HStack(spacing: bounds.width * 0.1){
                                Button(action: {
                                    viewNumber = 1
                                }, label: {
                                    Rectangle()
                                        .frame(width: bounds.width*0.18, height: bounds.height*0.2)
                                        .foregroundColor(.init(red: 0.04, green: 0.73, blue: 0.04, opacity: 1))
                                        .overlay(content: {
                                            Image(systemName: "questionmark.circle.fill")
                                                .font(.system(size: bounds.width * 0.08, weight: .medium, design: .default))
                                                .foregroundColor(.init(red: 0.9, green: 0.1, blue: 0.1, opacity: 1))
                                        })
                                    
                                })
                                .buttonStyle(.plain)
                                .buttonBorderShape(.roundedRectangle)
                                
                                
                                
                                Button(action: {}, label: {
                                    Rectangle()
                                        .frame(width: bounds.width*0.18, height: bounds.height*0.2)
                                        .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                        .overlay(content: {
                                            Image(systemName: "globe")
                                                .font(.system(size: bounds.width * 0.08, weight: .medium, design: .default))
                                                .foregroundColor(.init(white: 0.2))
                                        })
                                }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                                
                                
                               
                }.padding(.bottom, bounds.height * 0.06)
            }
            
            
            
            
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(viewNumber: .constant(Int(3)))
    }
}
