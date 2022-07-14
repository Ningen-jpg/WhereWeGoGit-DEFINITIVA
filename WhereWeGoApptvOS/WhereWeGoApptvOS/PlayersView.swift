//
//  ContentView.swift
//  ProvaInitialView
//
//  Created by fonztara on 06/07/22.
//

import SwiftUI

struct PlayersView: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    @Binding var viewNumber: Int
    @State var users = false
    @State private var isConnecting = false
    
    @ObservedObject var userConnection: UserConnection
    //    @State var profiles: [Profile] = userConnection.profiles
    
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
    
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    let buttonGradient = LinearGradient(colors: [Color(red: 60/255, green: 255/255, blue: 80/255, opacity: 1), Color(red: 70/255, green: 80/255, blue: 255/255, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    var body: some View {
        
        ZStack {
            
            Text("Title")
            .onAppear(){
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    if(userConnection.count > 0){
                        users = true
                    }
                }
            }
            
            PlayerView(video: "Mare")
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack {
                
                BlurView(style: .light)
                    .mask({
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width: bounds.width * 0.7, height: bounds.height * 0.8, alignment: .center)
                            
                        
                    })
                
//                Rectangle()
//                    .frame(width: bounds.width * 0.65, height: bounds.height * 0.8, alignment: .center)
//                                .cornerRadius(60)
                
                VStack(spacing: bounds.height * 0.02) {
                    
                    HStack(spacing: bounds.width * 0.04) {
                        VStack {
                            if(userConnection.count >= 1){
                                Image(uiImage: userConnection.profiles[0].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[0].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                        
                        
                        VStack {
                            if(userConnection.count >= 2){
                                Image(uiImage: userConnection.profiles[1].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.orange)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[1].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                            
                            
                        VStack {
                            if(userConnection.count >= 3){
                                Image(uiImage: userConnection.profiles[2].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[2].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                            
                            
                        VStack {
                            if(userConnection.count >= 4){
                                Image(uiImage: userConnection.profiles[3].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[3].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                            
                            
                    }.padding()
                    
                    HStack(spacing: bounds.width * 0.05) {
                        
                        VStack {
                            if(userConnection.count >= 5){
                                Image(uiImage: userConnection.profiles[4].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.cyan)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[4].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                            
                            
                        VStack {
                            if(userConnection.count >= 6){
                                Image(uiImage: userConnection.profiles[5].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.indigo)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[5].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                            
                            
                        VStack {
                            if(userConnection.count >= 7){
                                Image(uiImage: userConnection.profiles[6].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    
                            
                            .font(.system(size: bounds.width * 0.1))
                            }
                            else{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: bounds.width * 0.1))
                            }
                        Text(userConnection.profiles[6].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                            
                        }.scaleEffect(isConnecting ? 1.1 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                isConnecting.toggle()
                            })
                        }
                            
                            
//                        VStack {
//                        Image(systemName: "person.circle.fill")
//                                .foregroundColor(.pink)
//                            .font(.system(size: bounds.width * 0.1))
//                            Text(userConnection.profiles[7].name)
//                                .foregroundColor(.black)
//                                .font(.system(size: 40))
//                        }
                        
                    }.padding()
                    
                    
                    
                    //gray and off if no peer connected
                    
                    Spacer()
                    
                    
                }.offset(x: 0, y: bounds.height * 0.07)
                
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        if(userConnection.count > 0){
                            let message = "Start Quiz"
                            mpcManager.send(message: message)
                            viewNumber = 2
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: bounds.width * 0.13, height: bounds.height * 0.085)
                                .foregroundColor(users ? .init(red: 0.04, green: 0.73, blue: 0.04, opacity: 1) : .init(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                        Text("Start")
                                .foregroundColor(users ? .white : .init(red: 0.5, green: 0.5, blue: 0.5, opacity: 1))
                            .font(.system(size: bounds.height * 0.06, weight: .semibold))
                        }
                    })
                    .disabled(!users)
                    .padding()
                        .buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                }.offset(x: 0, y: bounds.height * -0.09)
                
                
                
                
                
            }
            
           
            
            
            
            
        }
        
        
        
        
        
        
        
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayersView(viewNumber: .constant(Int(3)), userConnection: UserConnection())
        }

    }
}
