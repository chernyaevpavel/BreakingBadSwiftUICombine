//
//  EpisodesViewModel.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 22.11.2021.
//

import Foundation


class EpisodesViewModel: ObservableObject {
    let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
}
