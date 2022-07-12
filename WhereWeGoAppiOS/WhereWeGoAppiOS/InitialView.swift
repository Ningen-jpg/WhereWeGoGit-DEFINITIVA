//
//  InitialView.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 07/07/22.
//

import SwiftUI

struct InitialView: View {
    var bounds = UIScreen.main.bounds
    @State var connected = false
    @Binding var viewNumber: Int
    let mpcManager = MPCManager.shared
    let bgGradient = LinearGradient(colors: [.green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    var body: some View {
            VStack{

                Button(action:{
                    if(mpcManager.initialView){
                        self.viewNumber=1
                    }
                    else{
                        print("Non va")
                        
                    }
                }, label: {
                    Rectangle()
                        .frame(width: bounds.width * 0.6, height: bounds.height * 0.15)
                        .cornerRadius(30)
                        .overlay(content: {
                            Text("Let's get started!")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, bounds.height * 0.3)

                })
                
                Button(action : {
                    mpcManager.startService()
                    
                    if(mpcManager.initialView){
                        connected = true
                    }
                }, label : {
                    Image(systemName: "appletv")
                        .font(.system(size: 80, weight: .bold))
                        .frame(width: bounds.width * 0.2, height: bounds.height * 0.1)
                        .foregroundColor(.black)
                })
                .frame(width: bounds.width * 0.2, height: bounds.height * 0.1)
            }
            .background(content: {
                Rectangle()
                    .fill(bgGradient)
                    .frame(width: bounds.width, height: bounds.height)
                    .edgesIgnoringSafeArea(.all)
            })
        }
    }
    
        


//struct InitialView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialView()
//    }
//}
