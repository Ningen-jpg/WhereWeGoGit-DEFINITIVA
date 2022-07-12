//
//  Profiles.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 11/07/22.
//

import Foundation
import MultipeerConnectivity

struct Profile1: Identifiable{
    var id = UUID()
    var name: String
}


class UserConnection: ObservableObject, MPCManagerDelegate {
    
    let mpcManager = MPCManager.shared
    var answers: [Int] = [0, 0, 0, 0]
    @Published var profiles: [Profile1] = [Profile1(name:"Username"), Profile1(name:"Username"), Profile1(name:"Username"), Profile1(name:"Username"), Profile1(name:"Username"), Profile1(name: "Username"), Profile1(name: "Username"), Profile1(name: "Username")]
    @Published var count: Int = 0
    var numQuestion = 2;
    @Published var viewNumber: Int = 2
    @Published var countAnswers: Int = 0
    init() {
        mpcManager.delegate = self
    }
    
    func mpcManager(_ manager: MPCManager, didReceive message: Profile, from peer: MCPeerID) {
        let name = message.name
        if(count<8){
            profiles[count].name = name
            count += 1
        }
        else{
            print("Max number of participants reached")
        }
    }
    
    func mpcManager(_ manager: MPCManager, userIsConnected user: String) {
       
    }
    
    func mpcManager(_ manager: MPCManager, didReceive message: Message, from peer: MCPeerID) {
        let num = message.number
        answers[num] += 1
        countAnswers += 1
        
        if(countAnswers == count){
            let ready = "Ready"
//            Calcola risposta con l'array
            answers = [0, 0, 0, 0]
            countAnswers = 0
            numQuestion += 1
//            mpcManager.send(message: ready)
            
        }
        
    }
}

