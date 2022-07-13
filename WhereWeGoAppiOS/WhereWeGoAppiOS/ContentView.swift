//
//  ContentView.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 05/07/22.
//

import SwiftUI

struct ContentView: View {
   @State var viewNumber = 0
    
    var body: some View {
        switch viewNumber{
        
//        case 1: SetUpView(viewNumber: $viewNumber)
        case 1: WaitingView(viewNumber: $viewNumber)
        case 3: VistaiOS(viewNumber: $viewNumber)
        case 4: WaitingView2(viewNumber: $viewNumber)
        case 5: WaitingView3(viewNumber: $viewNumber)
        default: SetUpView(viewNumber: $viewNumber)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
