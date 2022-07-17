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
    
    var answerPredict : [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let PredictionFinal =  SurveyML()
    
    let mpcManager = MPCManager.shared
    var answers: [Int] = [0, 0, 0, 0]
    @Published var profiles: [Profile1] = [Profile1(name:"Username1", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username2", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username3", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username4", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username5", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username6", image: UIImage(systemName: "person.circle.fill")!), Profile1(name:"Username7", image: UIImage(systemName: "person.circle.fill")!)]
    
    @Published var count: Int = 0
    var numQuestion = 2;
    @Published var viewNumber: Int = 2
    @Published var countAnswers: Int = 0
    let ready = "Ready"
    let end = "End"
    let rewind = "Rewind"
    init() {
        mpcManager.delegate = self
    }
    
    func mpcManager(_ manager: MPCManager, didReceive message: Profile, from peer: MCPeerID) {
        
        if(count<7){
            let name = message.name
            profiles[count].name = name
            if let data = message.image {
                if let image = UIImage(data: data){
                    profiles[count].image = image
                }
            }
           
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
            finalAnswer(answers: answers)
            
            print(answerPredict)
            
            answers = [0, 0, 0, 0]
            countAnswers = 0
            numQuestion += 1
            if(numQuestion != 12){
                
                mpcManager.send(message: ready)
            }
            else{
                PredictionFinal.predictionOutput(answerPredict: answerPredict)

                mpcManager.send(message: end)
            }
            
        }
        
    }
    
    func finalAnswer (answers : [Int]){
        var maxNum : Int = -1
        var index : Int = 0
        var count : Int = 0
        var x : Int = -1
        
        for i in answers {
            x += 1

            if (i > maxNum){
                maxNum = i
                index = x
            }
          //  print("answers [\(x)]",answers[x])
           // print("i",i)
        }
        
        for j in answers {
            if (j == maxNum){
                
                count += 1 // conteggio per vedere se c'è parità di voto
            }
          //  print("answers j ",answers[j])
            print("j: ",j)
            print("maxNum :",maxNum)
        } //[0.25, 0.5, 0.75, 1.0, 0.5, 0.25, 1.0, 0.75, 0.25, 0.25]
        print ("answers : ",answers)
      //  print ("maxNum : ",maxNum)
        print("Index:",index)
        print("Count:",count)
        
        if (count > 1)
        {
            answerPredict[numQuestion - 2] = 0
            
        }
        else
        {
            switch index{
            case 0: answerPredict[numQuestion - 2] = 0.25
            case 1: answerPredict[numQuestion - 2] = 0.50
            case 2: answerPredict[numQuestion - 2] = 0.75
            case 3: answerPredict[numQuestion - 2] = 1
            default : answerPredict[numQuestion - 2] = 0
            }
        
           // self.answers[numQuestion - 2] = maxNum
        }
        
    }
    
}
