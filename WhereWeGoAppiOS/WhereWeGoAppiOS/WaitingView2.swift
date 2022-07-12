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
    @State private var isLoading = false
    @State private var isBgRotating = false
    
    struct BlurView: UIViewRepresentable {

        let style: UIBlurEffect.Style

        func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
            let view = UIView(frame: .zero)
            view.backgroundColor = .clear
            let blurEffect = UIBlurEffect(style: style)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(blurView, at: 0)
            NSLayoutConstraint.activate([
                blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
                blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])
            return view
        }

        func updateUIView(_ uiView: UIView,
                          context: UIViewRepresentableContext<BlurView>) {
            

        }

    }
    
    func gradient(color1: Color, color2: Color) -> LinearGradient {
        LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var body: some View {
        
        
        let bgGradient = LinearGradient(colors: [.green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
        
        ZStack {
            
            Text("Title")
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    if(mpcManager.ready){
                        print(mpcManager.ready)
                        mpcManager.ready = false
                        viewNumber = 3
                    }
                }
            }
            
            Rectangle()
                        .fill(bgGradient)
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 200, opaque: true)

            Rectangle()
                .fill(gradient(color1: .red, color2: .green))
                .frame(width: bounds.width * 3, height: bounds.height * 2, alignment: .center)
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(Angle(degrees: isBgRotating ? 0 : 360))
                .onAppear() {
                    withAnimation(.linear.speed(0.1).repeatForever(autoreverses: false), {
                        isBgRotating.toggle()
                    })
                }
                
            
            VStack{
                Image(systemName: "hourglass.circle.fill")
                                .font(.system(size: 150))
                                .frame(width: 200, height: 200)
                                .scaleEffect(isLoading ? 1.1 : 1.0)
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
                                    .cornerRadius(50)
                                    
                                    
                                
                            })
                                            .frame(width: 300, height: 300)
                            Text("Waiting for other players...")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular, design: .default))
                    }
                }
            }
        }
    }
}


//struct WaitingView2_Previews: PreviewProvider {
//    static var previews: some View {
//        WaitingView2()
//    }
//}
