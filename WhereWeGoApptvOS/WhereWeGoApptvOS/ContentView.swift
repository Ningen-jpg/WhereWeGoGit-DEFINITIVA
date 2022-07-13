//
//  ContentView.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 05/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var viewNumber = 0
    @StateObject var userConnection: UserConnection = UserConnection()
    
    var body: some View {
        switch viewNumber{
        case 0: InitialView(viewNumber: $viewNumber)
        case 1: PlayersView(viewNumber: $viewNumber, userConnection: userConnection)
        case 12: ResultView(viewNumber: $viewNumber, userConnection: userConnection)
        default: QuestionViewtvOS(viewNumber: $viewNumber,userConnection: userConnection, question: Questions.questions[viewNumber - 2])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
