//
//  MainTab.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import SwiftUI


enum Tabs: String {
    case characters = "Герои"
    case episodes = "Эпизоды"
}

struct MainTab: View {
    let characterViewModel = CharacterViewModel(apiService: APIService())
    let episodeViewModel = EpisodesViewModel(apiService: APIService())
    
    var body: some View {
        TabView {
            CharctersListView(viewModel: characterViewModel)
                .tabItem { Label("Герои", systemImage: "person.3.fill") }
                .tag(Tabs.characters)
            EpisodesListView(viewModel: episodeViewModel)
                .tabItem { Label("Эпизоды", systemImage: "person.3.fill") }
                .tag(Tabs.episodes)
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
