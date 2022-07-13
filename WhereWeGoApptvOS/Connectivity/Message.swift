//
//  Message.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 05/07/22.
//

import Foundation

struct Message: Codable{
    let answer: Int
//    let username: String
    
    func toData() -> Data? {
        var data: Data? = nil
        
        do {
            data = try JSONEncoder().encode(self)
        } catch {
            print("An error occured")
        }
        
        return data
    }
    
    static func toMessage(from data: Data) -> Message? {
        try? JSONDecoder().decode(Message.self, from: data)
    }
}
