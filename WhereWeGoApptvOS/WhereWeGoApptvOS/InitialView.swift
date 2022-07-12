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
            
            HStack(spacing: 300){
                Button(action: {
                    viewNumber = 1
                }){
                    Rectangle()
                        .frame(width: bounds.width*0.3, height: bounds.height*0.3)
                        .foregroundColor(.green)
                        .overlay(content: {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.system(size: 200, weight: .medium, design: .default))
                                .foregroundColor(.red)
                        })
                    
                }
                
                
                
                
                Button(action: {}){
                    Rectangle()
                        .frame(width: bounds.width*0.3, height: bounds.height*0.3)
                        .foregroundColor(.green)
                        .overlay(content: {
                            Image(systemName: "globe")
                                .font(.system(size: 200, weight: .medium, design: .default))
                                .foregroundColor(Color(red: 0.2, green: 0.3, blue: 0.3, opacity: 1))
                        })
                }
                
                
               
            }
            
            
        }
    }
}

//struct InitialView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialView()
//    }
//}
