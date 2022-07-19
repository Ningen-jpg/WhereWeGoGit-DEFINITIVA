//
//  DetailsView.swift
//  WhereWeGoApptvOS
//
//  Created by fonztara on 16/07/22.
//

import SwiftUI

struct DetailsView: View {
    @Binding var isDetailsViewDisplayed: Bool
    
    @Namespace var mainNamespace
    
    var bounds = UIScreen.main.bounds
    
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    
    
    var body: some View {
        
        ZStack {
            PlayerView(video: "Mare")
                .edgesIgnoringSafeArea(.all)
            BlurView(style: .light)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                
                
                VStack(spacing: -120) {
                    
                    Text("Destination")
                        .frame(width: bounds.width, alignment: .center)
                        .font(.system(size: 100, weight: .bold, design: .default))
                        .shadow(color: .black, radius: 50, x: 0, y: 0)
                    
                    Button(action: {
                        isDetailsViewDisplayed.toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.black)
                            Text("X")
                                .foregroundColor(.white)
                                .font(.system(size: 70, weight: .medium, design: .rounded))
                        }
                        
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .frame(width: bounds.width * 0.9, alignment: .trailing)
                }
                
                    
                    
                
                    
                
                
                ScrollView {
                    VStack(spacing: 30) {
                        
                        VStack(spacing: 20) {
                            Text("Night Clubs")
                                .foregroundColor(.black)
                                .frame(width: bounds.width, alignment: .leading)
                                .font(.system(size: 80, weight: .bold, design: .default))
                                .padding(.leading, 200)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 80) {
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                        
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    
                                    
                                }
                            }.frame(width: bounds.width * 0.9, alignment: .center)
                        }
                        
                        VStack(spacing: 20) {
                            Text("Hotels")
                                .foregroundColor(.black)
                                .frame(width: bounds.width, alignment: .leading)
                                .font(.system(size: 80, weight: .bold, design: .default))
                                .padding(.leading, 200)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 80) {
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    
                                    
                                }
                            }.frame(width: bounds.width * 0.9, alignment: .center)
                        }
                        
                        VStack(spacing: 20) {
                            Text("Beaches")
                                .foregroundColor(.black)
                                .frame(width: bounds.width, alignment: .leading)
                                .font(.system(size: 80, weight: .bold, design: .default))
                                .padding(.leading, 200)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 80) {
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    Button(action: {}, label: {
                                        Rectangle()
                                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                                            .foregroundColor(.white)
                                    }).buttonStyle(.plain)
                                        .buttonBorderShape(.roundedRectangle)
                                    
                                    
                                    
                                }
                            }.frame(width: bounds.width * 0.9, alignment: .center)
                        }
                            }
                        }.prefersDefaultFocus(in: mainNamespace)
                        
                        
                    }.focusScope(mainNamespace)
                    
                    
                }
            
            
        
        
        
        
        
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(isDetailsViewDisplayed: .constant(true))
    }
}
