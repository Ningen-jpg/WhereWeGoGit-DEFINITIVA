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
    
    @StateObject var userConnection: UserConnection = UserConnection()
//    @State var profiles: [Profile] = userConnection.profiles
    
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    let buttonGradient = LinearGradient(colors: [Color(red: 60/255, green: 255/255, blue: 80/255, opacity: 1), Color(red: 70/255, green: 80/255, blue: 255/255, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    var body: some View {
        
        
        
        
        ZStack {
            
            Rectangle()
                .fill(bgGradient)
                .blur(radius: 300, opaque: true)
            
            
            ZStack {
                Rectangle()
                    .frame(width: bounds.width * 0.65, height: bounds.height * 0.8, alignment: .center)
                                .cornerRadius(60)
                
                VStack {
                    
                    HStack {
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[0].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[1].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[2].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[3].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                    }.padding()
                    
                    HStack {
                        
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[4].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[5].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[6].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        VStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 170))
                            Text(userConnection.profiles[7].name)
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        
                    }.padding()
                    
                    
                    Button(action: {
                        if(userConnection.count > 0){
                            let message = "Start Quiz"
                            mpcManager.send(message: message)
                            viewNumber = 2
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 250, height: 100)
                                .cornerRadius(30)
                                .foregroundColor(.pink)
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.system(size: 60, weight: .semibold))
                        }
                    }).padding()
                    
                    
                }
                
            }
            
           
            
            
            
            
        }
        
        
        
        
        
        
        
    }
}

//struct PlayersView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            PlayersView()
//        }
//
//    }
//}
