//
//  SwiftUIView.swift
//  ProvaInitialView
//
//  Created by fonztara on 10/07/22.
//

import SwiftUI

struct ResultView: View {
    @Namespace var mainNamespace
    @Binding var viewNumber: Int
    @ObservedObject var userConnection: UserConnection
    let mpcManager = MPCManager.shared
    
    var bounds = UIScreen.main.bounds
    
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var myPreferredFocusedView: UIView?
    
    
    var body: some View {
        
        let detailsButton = Button(action: {}, label: {
            ZStack {
                Rectangle()
                    .frame(width: bounds.width * 0.2, height: bounds.height * 0.15)
                    .foregroundColor(.init(red: 0.04, green: 0.73, blue: 0.04, opacity: 1))
            Text("Details")
                .foregroundColor(.white)
                .font(.system(size: bounds.height * 0.07, weight: .semibold))
            }
        }).buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle)
        .padding(.bottom)
        
        ZStack {
        
            PlayerView(video: "Mare")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: bounds.height * 0.4) {
                
                
                Spacer()
                HStack(spacing: bounds.width * 0.05) {
                    Spacer()
                    Button(action: {
                        mpcManager.send(message: userConnection.rewind)
                        mpcManager.result = false
                        viewNumber = 0
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: bounds.width * 0.12, height: bounds.height * 0.15)
                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                
                        Image(systemName: "house.fill")
                                .font(.system(size: bounds.height * 0.07))
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
                                .frame(width: bounds.width * 0.12, height: bounds.height * 0.15)
                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                
                        Text("Next")
                                .foregroundColor((.init(white: 0.3)))
                                .font(.system(size: bounds.height * 0.065, weight: .semibold))
                        }
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom)
                    
                                
                                
                          Spacer()
                }.padding(.bottom)
                    .focusScope(mainNamespace)
            }
            
        }
    }
}

struct ResultViewView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewNumber: .constant(Int(3)), userConnection: UserConnection())
    }
}
