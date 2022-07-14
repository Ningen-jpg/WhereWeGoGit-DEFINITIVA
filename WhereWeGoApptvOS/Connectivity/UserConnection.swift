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
    var image: UIImage
}


class UserConnection: ObservableObject, MPCManagerDelegate {
    
    let mpcManager = MPCManager.shared
    var answers: [Int] = [0, 0, 0, 0]
    @Published var profiles: [Profile1] = [Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username", image: UIImage(systemName: "person.circle.fill")!)]
    
    @Published var count: Int = 0
    var numQuestion = 2;
    @Published var viewNumber: Int = 2
    @Published var countAnswers: Int = 0
    let ready = "Ready"
    let end = "End"
    init() {
        mpcManager.delegate = self
    }
    
    func mpcManager(_ manager: MPCManager, didReceive message: Profile, from peer: MCPeerID) {
        let name = message.name
        let image = UIImage(data: message.image!)
        if(count<7){
            profiles[count].name = name
            profiles[count].image = image!
            print(count)
            count += 1
            print(count)
        }
        else{
            print("Max number of participants reached")
        }
    }
    
    func mpcManager(_ manager: MPCManager, userIsConnected user: String) {
       
    }
    
    func mpcManager(_ manager: MPCManager, didReceive message: Message, from peer: MCPeerID) {
        let num = message.answer
        answers[num] += 1
        countAnswers += 1

        if(countAnswers == count){
            
//            Calcola risposta con l'array
            answers = [0, 0, 0, 0]
            countAnswers = 0
            numQuestion += 1
            if(numQuestion != 12){
                mpcManager.send(message: ready)
            }
            else{
                mpcManager.send(message: end)
            }
            
        }
        
    }
}

