//
//  EpisodesListView.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 22.11.2021.
//

import SwiftUI

struct EpisodesListView: View {
    @ObservedObject var viewModel: EpisodesViewModel
    
    var body: some View {
        List(self.viewModel.episodes) { episode in
            VStack(alignment: .leading) {
                Text(episode.title)
                    .font(.title)
                Text("Date: \(episode.airDate)")
                    .font(.subheadline)
                Text("Season: \(episode.season)")
                    .font(.subheadline)
            }
        }.onAppear(perform: {
            self.viewModel.getEpisodes()
        })
        .navigationTitle("episode")
    }
}

