//
//  ContentView.swift
//  ProvaViewiPhone
//
//  Created by fonztara on 07/07/22.
//

import SwiftUI

struct WaitingView3: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    @Binding var viewNumber: Int
    @State var rewind = false
    @State private var isLoading = false
    @State private var isBgRotating = false
    
    @State var waitingText2 = "Pack up, you are going to"
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
                    print(viewNumber)
                    if(mpcManager.rewind){
                        rewind = true
                        print("rewind")
                        timer.invalidate()
                    }
                }
            }
            
//            Text("Title")
//                .onAppear(){
//                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                    print(ready)
//                    if(ready){
//                        ready = false
//                        print(ready)
//                        viewNumber = 3
//                    }
//                }
//            }
            
            

            if(!rewind){
                BgView()
                
                
            
                VStack{
                    Image(systemName: "airplane")
                        .font(.system(size: bounds.width * 0.3))
                                    .foregroundColor(.white)
                                    .frame(width: bounds.width * 0.4, height: bounds.height * 0.2)
//                                    .scaleEffect(isLoading ? 1.2 : 1.0)
                                    .offset(x: isLoading ? bounds.height * 0.1 : 0, y: 0)
                                    .rotationEffect(Angle(degrees: 270))
                                    .onAppear() {
                                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), {
                                            isLoading.toggle()
                                        })
                                    }
                    
                    ZStack {
                    
                        ZStack {
                            BlurView(style: .systemThinMaterialLight)
                                .mask({
                                    Rectangle()
                                        .cornerRadius(10)
                                        
                                        
                                
                                })
                                .frame(width: bounds.width * 0.6, height: bounds.height * 0.16)
    //                            Text("Waiting for other players to answer")
    //                                .foregroundColor(.white)
    //                                .font(.system(size: 18, weight: .regular, design: .default))
    //                                .frame(width: 200, height: 200)
    //                                .multilineTextAlignment(.center)
                            
                            Text("\(waitingText2)")
                                .foregroundColor(.black)
                                .font(.system(size: bounds.width * 0.07, weight: .medium, design: .default))
                                .frame(width: bounds.width * 0.6)
                                .multilineTextAlignment(.center)
                                        .onReceive(timer) { _ in
                                            if waitingText2 == "Pack up, you are going to" {
                                                waitingText2 = "Pack up, you are going to."
                                            } else if waitingText2 == "Pack up, you are going to." {
                                                    waitingText2 = "Pack up, you are going to.."
                                            } else if waitingText2 == "Pack up, you are going to.." {
                                                waitingText2 = "Pack up, you are going to..."
                                            } else if waitingText2 == "Pack up, you are going to..." {
                                                waitingText2 = "Pack up, you are going to"
                                            }
                                        }
                        
                        }
                    }
                }.padding(.bottom, bounds.height * 0.3)
            }
            else{
                Text("Qualcosa")
                    .onAppear(){
                        print("numero")
                        rewind = false
                        mpcManager.rewind = false
                        mpcManager.end = false
                        viewNumber = 1
                    }
            }
        }
        .onAppear(){
            HapticManager.instance.impact(style: .heavy)
            HapticManager.instance.impact(style: .heavy)
            HapticManager.instance.impact(style: .heavy)
            HapticManager.instance.notification(type: .error)
            mpcManager.rewind = false
    }
}


struct WaitingView3_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView3(viewNumber: .constant(Int(3)))
    }
}
}
