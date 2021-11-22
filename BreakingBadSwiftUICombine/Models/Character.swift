//
//  Character.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import Foundation

struct Character: Codable, Identifiable {
    
    let id: UUID = UUID()
    let charId: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: URL
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
    
}
