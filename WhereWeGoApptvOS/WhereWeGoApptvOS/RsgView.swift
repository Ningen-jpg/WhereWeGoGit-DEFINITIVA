//
//  RsgView.swift
//  WhereWeGoApptvOS
//
//  Created by fonztara on 15/07/22.
//

import SwiftUI

struct RsgView: View {
    @State var goText = "Ready"
    @State var goTextColor = Color(.red)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var bounds = UIScreen.main.bounds
    

    
    var body: some View {
        ZStack {
            
            PlayerView(video: "Mare")
                .edgesIgnoringSafeArea(.all)
            
            BlurView(style: .light)
                .mask({
                    Rectangle()
                        .cornerRadius(30)
                        .frame(width: bounds.width * 0.7, height: bounds.height * 0.8, alignment: .center)
                        
                    
                    
                })
            
            
            Text("\(goText)")
                                    .foregroundColor(goTextColor)
                                    .font(.system(size: bounds.width * 0.1, weight: .bold, design: .rounded))
                                    .frame(width: bounds.width * 0.5)
                                    .multilineTextAlignment(.center)
                                            .onReceive(timer) { _ in
                                                if goText == "Ready" {
                                                    goText = "Set"
                                                    goTextColor = Color(.yellow)
                                                } else if goText == "Set" {
                                                    goText = "Go"
                                                    goTextColor = Color(.green)
                                                } else {
                                                    
                                                }
                                            }
            
        }
    }
}

struct RsgView_Previews: PreviewProvider {
    static var previews: some View {
        RsgView()
    }
}
