//
//  SwiftUIView.swift
//  ProvaInitialView
//
//  Created by fonztara on 10/07/22.
//

import SwiftUI

struct ContentView2: View {
    @Namespace var mainNamespace
    
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var myPreferredFocusedView: UIView?
    
    
    var body: some View {
        
        let detailsButton = Button(action: {}, label: {
            ZStack {
                Rectangle()
                    .frame(width: 350, height: 150)
                    .foregroundColor(.green)
            Text("Details")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .semibold))
            }
        }).buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle)
        .padding(.bottom)
        
        ZStack {
        
            PlayerView(video: "Mare")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                
                
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 150)
                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                
                        Image(systemName: "house.fill")
                                .font(.system(size: 70))
                                .foregroundColor((.init(white: 0.3)))
                                
                        }
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom)
                    
                    
                    
                    detailsButton
                        .prefersDefaultFocus(in: mainNamespace)
                    
                    
                    Button(action: {}, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 150)
                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                
                        Text("Skip")
                                .foregroundColor((.init(white: 0.3)))
                                .font(.system(size: 60, weight: .semibold))
                        }
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom)
                    
                                
                                
                          Spacer()
                }.padding(.bottom, 80)
                    .focusScope(mainNamespace)
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
