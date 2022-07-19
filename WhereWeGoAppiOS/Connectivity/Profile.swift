//
//  Profile.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 08/07/22.
//

import Foundation

struct Profile: Codable{
    let name: String
    let image: Data?
    
    func toData() -> Data? {
        var data: Data? = nil
        
        do {
            data = try JSONEncoder().encode(self)
        } catch {
            print("An error occured")
        }
        
        return data
    }
    
    static func toMessage(from data: Data) -> Profile? {
        try? JSONDecoder().decode(Profile.self, from: data)
    }
}
