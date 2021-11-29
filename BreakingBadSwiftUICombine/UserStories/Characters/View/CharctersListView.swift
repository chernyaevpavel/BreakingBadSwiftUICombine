//
//  CharctersListView.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import SwiftUI
import Combine
import Kingfisher

struct CharctersListView: View {

    @ObservedObject var viewModel: CharacterViewModel
    
    
    var body: some View {
        
        List(self.viewModel.characters) { character in
            HStack(alignment: .top) {
                KFImage(character.img)
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.title)
                    Text(character.birthday)
                        .font(.subheadline)
                    Text(character.status)
                        .font(.subheadline)
                }
                
            }
            
        }.onAppear(perform: {
            self.viewModel.getCharacters()
        })
        .navigationTitle("character")

    }
}
