//
//  VistaiOS2.swift
//  WhereWeGoAppiOS
//
//  Created by fonztara on 14/07/22.
//

import SwiftUI

struct VistaiOS2: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    @Binding var viewNumber: Int


    var body: some View {
        
            VStack(spacing:0){
                        HStack(spacing:0){
                            
                            Button(action: {
                                let message = Message(answer: 0)
                                mpcManager.send(message: message)
                                viewNumber = 4;
                                
                            }, label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(red: 1, green: 0.3, blue: 0.3))
                                        .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                                    
                                    Text("1")
                                        .foregroundColor(.white)
                                        .font(.system(size: bounds.width * 0.25, weight: .bold, design: .default))
                                        
                                                        
                                }
                                
                                
                            }).buttonStyle(.plain)
                            
                            
                                
                                
                            
                            
                            
                            Button(action: {
                                let message = Message(answer: 1)
                                mpcManager.send(message: message)
                                viewNumber = 4;
                                
                            }, label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(red: 0.4, green: 0.80, blue: 0.3))
                                        .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                                    
                                    Text("2")
                                        .foregroundColor(.white)
                                        .font(.system(size: bounds.width * 0.25, weight: .bold, design: .default))
                                        
                                                        
                                }
                                
                                
                            }).buttonStyle(.plain)
                            
                            
                            
                        }
                        
                        HStack(spacing:0){
                            Button(action: {
                                let message = Message(answer: 2)
                                mpcManager.send(message: message)
                                viewNumber = 4;
                                
                            }, label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(red: 0.3, green: 0.25, blue: 1.0))
                                        .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                                    
                                    Text("3")
                                        .foregroundColor(.white)
                                        .font(.system(size: bounds.width * 0.25, weight: .bold, design: .default))
                                        
                                                        
                                }
                                
                                
                            }).buttonStyle(.plain)
                            
                            
                            
                            
                            
                            Button(action: {
                                let message = Message(answer: 3)
                                mpcManager.send(message: message)
                                viewNumber = 4;
                                
                            }, label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.9))
                                        .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                                    
                                    Text("4")
                                        .foregroundColor(.white)
                                        .font(.system(size: bounds.width * 0.25, weight: .bold, design: .default))
                                        
                                                        
                                }
                                
                                
                            }).buttonStyle(.plain)
                            
                            
                            
                        }
                    }.edgesIgnoringSafeArea(.all)
        
        
    }
}

struct VistaiOS2_Previews: PreviewProvider {
    static var previews: some View {
        VistaiOS2(viewNumber: .constant(Int(3)))
    }
}
