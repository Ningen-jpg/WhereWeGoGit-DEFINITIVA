//
//  SetUpView.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 07/07/22.
//

import SwiftUI

struct SetUpView: View {
    let mpcManager = MPCManager.shared
    var bounds = UIScreen.main.bounds
    @State var username: String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @Binding var viewNumber: Int
    let nearBlack = Color(red: 0.1, green: 0.1, blue: 0.1, opacity: 1)
   
  
    
    
    var body: some View {
            let bgGradient = LinearGradient(colors: [.green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            let grayGradient = LinearGradient(colors: [.gray, nearBlack], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(spacing: 10){
                VStack{
                    
                    if selectedImage != nil {
                        Button(action: {
                            
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                            
                        }, label: {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(
                                    Circle()
                                )
                                .frame(width: bounds.width * 0.5, height: bounds.height * 0.25)
                                
                        })
                            
                        
                        
                    } else {
                        Button(action: {
                            
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                            
                            
                        }, label: {
                            ZStack{
                                
                                Circle()
                                    .fill(grayGradient)
                                    .frame(width: bounds.width * 0.5, height: bounds.height * 0.25)
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: bounds.width * 0.3, height: bounds.height * 0.2)
                                    .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1))
                                
                            }
    //                        .padding(.top, 40)
                        })
                        
                    }
                    
    //                Button("Camera") {
    //                    self.sourceType = .camera
    //                    self.isImagePickerDisplay.toggle()
    //                }
    //                .padding()
    //                .foregroundColor(.blue)
    //                .background(
    //                Rectangle()
    //                    .foregroundColor(Color( red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
    //                    .frame(width: bounds.width * 0.22, height: bounds.height * 0.05)
    //                    .cornerRadius(15)
    //                )
    //
    //                Button("Gallery") {
    //                    self.sourceType = .photoLibrary
    //                    self.isImagePickerDisplay.toggle()
    //                }
    //                .padding()
    //                .foregroundColor(.blue)
    //                .background(
    //                Rectangle()
    //                    .foregroundColor(Color( red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
    //                    .frame(width: bounds.width * 0.22, height: bounds.height * 0.05)
    //                    .cornerRadius(15)
    //                )
                }
                .navigationBarTitle("Demo")
                .sheet(isPresented: self.$isImagePickerDisplay) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                }
                
                VStack(spacing:10){
               
                TextField(
                        "User name",
                        text: $username
                    )
                   
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .frame(width: bounds.width * 0.5)
                    .font(.system(size: 25, weight: .regular))
                    .multilineTextAlignment(.center)
                    .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1.5)
                        )
                    .padding(.bottom, 50)
                    .foregroundColor(.black)
                    
                    
                    
                    
                }
                
                Button(action: {
                    let profile = Profile(name: username)
                    mpcManager.send(profile: profile)
                    self.viewNumber = 2
                    
                }){
                
                    Text("Invia")
                        .foregroundColor(.blue)
                        .font(.system(size: 30, weight: .bold))
                        .background(
                        Rectangle()
                            .foregroundColor(Color( red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                            .frame(width: bounds.width * 0.4, height: bounds.height * 0.1)
                            .cornerRadius(30)
                        )
                    
                }
                .padding(.top, 290)
            }
            .frame(width: bounds.width, height: bounds.height)
            .background(
                Rectangle()
                    .fill(bgGradient)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 200, opaque: true)
                
            )
            
        }
    }



//struct SetUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetUpView()
//    }
//}
