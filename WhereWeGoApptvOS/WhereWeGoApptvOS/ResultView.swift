//
//  SwiftUIView.swift
//  ProvaInitialView
//
//  Created by fonztara on 10/07/22.
//

import SwiftUI

struct ContentView2: View {
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    var body: some View {
        
        ZStack {
        
        Rectangle()
            .fill(bgGradient)
            .blur(radius: 300, opaque: true)
            
            VStack {
                HStack {
                    Button(action: {}, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 150, height: 100)
                                .cornerRadius(30)
                                .foregroundColor(.black)
                            Image(systemName: "house.fill")
                                                        .font(.system(size: 50))
                                                        .foregroundColor(.white)
                        }
                        
                        
                    }).padding()
                        .offset(x: 20, y: 10)
                    Spacer()
                    
                }
                
                
                Spacer()
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 150)
                                .cornerRadius(30)
                                .foregroundColor(.pink)
                        Text("Details")
                            .foregroundColor(.white)
                            .font(.system(size: 70, weight: .semibold))
                        }
                    }).padding(.bottom)
                    
                    
                    Button(action: {}, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 150)
                                .cornerRadius(30)
                                .foregroundColor(.gray)
                                
                        Text("Skip")
                                .foregroundColor(.white)
                                .font(.system(size: 70, weight: .semibold))
                        }
                    }).padding(.bottom)
                    
                                
                                
                          Spacer()
                }.padding(.bottom)
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
