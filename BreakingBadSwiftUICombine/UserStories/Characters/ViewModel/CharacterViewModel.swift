//
//  CharacterViewModel.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    private var  apiService: APIService
    @Published var characters: [Character] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getCharacters() {
        apiService.getCharacters()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] characters in
                guard let self = self else { return }
                self.characters = characters
            }
            .store(in: &cancellable)
    }
}
