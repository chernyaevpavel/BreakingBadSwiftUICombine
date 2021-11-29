//
//  EpisodesViewModel.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 22.11.2021.
//

import Foundation
import Combine


class EpisodesViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var episodes: [Episode] = []
    let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getEpisodes() {
        apiService.getEpisodes()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] episodes in
                guard let self = self else { return }
                self.episodes = episodes
            }
            .store(in: &cancellable)
    }
}
