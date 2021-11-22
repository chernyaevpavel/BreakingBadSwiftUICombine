//
//  CharacterViewModel.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    var  apiService: APIService
    @Published var characters: [Character] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getCharacters() {
        apiService.getCharacters { characters in
            self.characters = characters
        }
    }
}
