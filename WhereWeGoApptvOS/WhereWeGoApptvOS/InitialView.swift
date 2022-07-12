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
                
                HStack(spacing: 150){
                                Button(action: {
                                    viewNumber = 1
                                }, label: {
                                    Rectangle()
                                        .frame(width: bounds.width*0.18, height: bounds.height*0.2)
                                        .foregroundColor(.init(red: 0.3, green: 0.85, blue: 0.3, opacity: 1))
                                        .overlay(content: {
                                            Image(systemName: "questionmark.circle.fill")
                                                .font(.system(size: 160, weight: .medium, design: .default))
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
                                                .font(.system(size: 145, weight: .medium, design: .default))
                                                .foregroundColor(.gray)
                                        })
                                }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                                
                                
                               
                }.padding(.bottom, 100)
            }
            
            
            
            
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(viewNumber: .constant(Int(3)))
    }
}
