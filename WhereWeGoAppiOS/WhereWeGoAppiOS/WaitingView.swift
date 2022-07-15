//
//  ContentView.swift
//  ProvaViewiPhone
//
//  Created by fonztara on 07/07/22.
//

import SwiftUI

struct WaitingView: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    
    @Binding var viewNumber: Int
    @State private var isLoading = false
    @State private var isBgRotating = false
    
    @State var waitingText = "Please, wait"
    let timer = Timer.publish(every: 0.6, on: .main, in: .common).autoconnect()
    

    
    func gradient(color1: Color, color2: Color) -> LinearGradient {
        LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var body: some View {
        
        
//        let bgGradient = LinearGradient(colors: [.green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
        
        ZStack {
            
            Text("Title")
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        print("waiting1")
                    if(mpcManager.quiz){
                        mpcManager.quiz = false
                        viewNumber = 3
                        timer.invalidate()
                    }
                }
            }
            
            

            BgView()
                
            
            VStack{
                Image(systemName: "hourglass.circle.fill")
                    .font(.system(size: bounds.width * 0.3))
                                .foregroundColor(.white)
                                .frame(width: bounds.width * 0.4, height: bounds.height * 0.2)
//                                .scaleEffect(isLoading ? 1.1 : 1.0)
                                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                                .onAppear() {
                                    withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1).repeatForever(autoreverses: false), {
                                        isLoading.toggle()
                                    })
                                }
                
                ZStack {
                
                    ZStack {
                        BlurView(style: .systemThickMaterialDark)
                            .mask({
                                Rectangle()
                                    .cornerRadius(10)
                                    
                                    
                                
                            })
                            .frame(width: bounds.width * 0.5, height: bounds.height * 0.12)
                        
//                            Text("Please, wait...")
//                            .foregroundColor(.white)
//                            .font(.system(size: 25, weight: .medium, design: .default))
                        
                        Text("\(waitingText)")
                            .foregroundColor(.white)
                            .font(.system(size: bounds.width * 0.07, weight: .medium, design: .default))
                            .frame(width: bounds.width * 0.5)
                            .multilineTextAlignment(.center)
                                    .onReceive(timer) { _ in
                                        if waitingText == "Please, wait" {
                                            waitingText = "Please, wait."
                                        } else if waitingText == "Please, wait." {
                                            waitingText = "Please, wait.."
                                        } else if waitingText == "Please, wait.." {
                                            waitingText = "Please, wait..."
                                        } else if waitingText == "Please, wait..." {
                                            waitingText = "Please, wait"
                                        }
                                    }
                                
                    }
                }
            }.padding(.bottom, bounds.height * 0.3)
        }
    }
}


struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView(viewNumber: .constant(Int(3)))
    }
}
