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
    
    var body: some View {
        TabView {
            CharctersListView(viewModel: characterViewModel)
                .tabItem { Label("Герои", systemImage: "person.3.fill") }
                .tag(Tabs.characters)
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
