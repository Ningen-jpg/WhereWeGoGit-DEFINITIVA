//
//  ContentView.swift
//  Quiz
//
//  Created by Stefano Leva on 03/07/22.
//

import SwiftUI

struct VistaiOS: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    @Binding var viewNumber: Int


    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                let redButton = Button(action: {
                    let message = Message(answer: 0)
                    mpcManager.send(message: message)
                    viewNumber = 4;
                    
                }){
                    Text("1")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                
                redButton.background(.red)
                
                let greenButton = Button(action: {
                    let message = Message(answer: 1)
                    mpcManager.send(message: message)
                    viewNumber = 4;
                }){
                    Text("2")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                greenButton.background(.green)
            }
            
            HStack(spacing:0){
                let blueButton = Button(action: {
                    let message = Message(answer: 2)
                    mpcManager.send(message: message)
                    viewNumber = 4;
                }){
                    Text("3")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                blueButton.background(.blue)
                
                let purpleButton = Button(action: {
                    let message = Message(answer: 3)
                    mpcManager.send(message: message)
                    viewNumber = 4;
                }){
                    Text("4")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                purpleButton.background(.purple)
            }
        }
    }
}

//struct VistaiOS_Previews: PreviewProvider {
//    static var previews: some View {
//        VistaiOS()
//    }
//}
