//
//  ContentView.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 05/07/22.
//
//provaaa test leonardo
import SwiftUI

struct ContentView: View {
   @State var viewNumber = 0
    
    var body: some View {
        switch viewNumber{
        case 0: InitialView(viewNumber: $viewNumber)
        case 1: PlayersView(viewNumber: $viewNumber)
        default: QuestionViewtvOS(viewNumber: $viewNumber, question: Questions.questions[viewNumber - 2])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
