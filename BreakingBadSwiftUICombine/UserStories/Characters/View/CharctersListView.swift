//
//  CharctersListView.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import SwiftUI
import Combine

struct CharctersListView: View {

    @ObservedObject var viewModel: CharacterViewModel
    
    
    var body: some View {
        
        List(self.viewModel.characters) { character in
            Text(character.name)
        }.onAppear(perform: {
            self.viewModel.getCharacters()
        })
        .navigationTitle("character")

    }
}
