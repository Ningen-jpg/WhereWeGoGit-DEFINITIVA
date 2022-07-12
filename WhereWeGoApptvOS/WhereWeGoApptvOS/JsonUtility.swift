//
//  JsonUtility.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 06/07/22.
//

import Foundation

struct JsonUtility{
    
   static func readJSON<T: Decodable>(fileName: String) -> [T] {
      if let url = Bundle.main.url(forResource: fileName, withExtension: "apns") {
        do {
          let data = try Data(contentsOf: url)
          return try JSONDecoder().decode([T].self, from: data)
        } catch {
          print("Failed decoding JSON file: \(fileName).")
          return []
        }
      }
      return []
    }
    
}
