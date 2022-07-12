//
//  Question.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 05/07/22.
//

import Foundation



struct Question: Decodable{
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    
//    private enum Key: Decodable, CodingKey {
//
//        case question
//        case option1
//        case option2
//        case option3
//        case option4
//
//    }
    

//    if let path = Bundle.main.path(forResource: "People", ofType: "json") {
//        let peoplesArray = try! JSONSerialization.jsonObject(
//                with: Data(contentsOf: URL(fileURLWithPath: path)),
//                options: JSONSerialization.ReadingOptions()
//        ) as? [AnyObject]
//        for people in peoplesArray! {
//            print(people)
//        }
//    }
    
}

extension Question{
    static func fetchQuestions() -> [Question] {
        return JsonUtility.readJSON(fileName: "Questions") as [Question]
    }
}
