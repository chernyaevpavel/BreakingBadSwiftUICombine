//
//  Episode.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import Foundation

struct Episode: Codable, Identifiable {
    let id: UUID = UUID()
    let episodeId: Int
    let title: String
    let season: String
    let airDate: String
    let characters: [String]
    let episode: String
    let series: String
}
