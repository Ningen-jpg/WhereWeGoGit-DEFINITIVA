//
//  ContentView.swift
//  ProvaViewiPhone
//
//  Created by fonztara on 07/07/22.
//

import SwiftUI

struct WaitingView2: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    @Binding var viewNumber: Int
    @State var ready = false
    @State var end = false
    @State private var isLoading = false
    @State private var isBgRotating = false
    
    @State var waitingText2 = "Waiting for other players to answer"
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
                    if(mpcManager.ready){
                        ready = true
                        print("true")
                        timer.invalidate()
                    }
                    if(mpcManager.end){
                        end = true
                        print("end")
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
            
            

            if(!ready && !end){
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
                                .font(.system(size: bounds.width * 0.06, weight: .medium, design: .default))
                                .frame(width: bounds.width * 0.6)
                                .multilineTextAlignment(.center)
                                        .onReceive(timer) { _ in
                                            if waitingText2 == "Waiting for other players to answer" {
                                                waitingText2 = "Waiting for other players to answer."
                                            } else if waitingText2 == "Waiting for other players to answer." {
                                                    waitingText2 = "Waiting for other players to answer.."
                                            } else if waitingText2 == "Waiting for other players to answer.." {
                                                waitingText2 = "Waiting for other players to answer..."
                                            } else if waitingText2 == "Waiting for other players to answer..." {
                                                waitingText2 = "Waiting for other players to answer"
                                            }
                                        }
                        
                        }
                    }
                }.padding(.bottom, bounds.height * 0.3)
            }
            else{
                Text("Qualcosa")
                    .onAppear(){
                        if(ready){
                            print("numero")
                            ready = false
                            mpcManager.ready = false
                            viewNumber = 3
                        }
                        if(end){
                            print("numero")
                            end = false
                            mpcManager.end = false
                            viewNumber = 5
                        }
                    }
            }
        }
    }
}


struct WaitingView2_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView2(viewNumber: .constant(Int(3)))
    }
}
