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
    
    
    var body: some View {
        ZStack {
        BgView()
        
            VStack {
            
                
                
                Button(action : {
                    mpcManager.startService()
                    
                    if(mpcManager.initialView){
                        connected = true
                    }
                }, label : {
                    Image(systemName: "appletv")
                        .font(.system(size: 50, weight: .semibold))
                        .frame(width: bounds.width * 0.2, height: bounds.height * 0.1)
                        .foregroundColor(connected ? .green : .red)
                })
                .frame(width: bounds.width * 0.2, height: bounds.height * 0.1)
                .padding(.top, bounds.height * 0.53)
                .offset(x: bounds.width * 0.35, y: 0)
            

                Button(action:{
                    if(mpcManager.initialView){
                        self.viewNumber=1
                    }
                    else{
                        print("Non va")
                        
                    }
                }, label: {
                    ZStack {
                        BlurView(style: .systemThinMaterialLight)
                                                .mask({
                                                    Rectangle()
                                                                            .frame(width: bounds.width * 0.6, height: bounds.height * 0.15)
                                                                            .cornerRadius(30)
                                                                            })
                        Text("Let's get started")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom, bounds.height * 0.2)

                }).shadow(color: .init(white: 0.1, opacity: 0.8), radius: 30, x: 0, y: 35)
                
                
                
                
                
            
        
            }
        }
    }
}
        


struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(viewNumber: .constant(Int(3)))
    }
}
