//
//  CharctersListView.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import SwiftUI


struct CharctersListView: View {
    @ObservedObject var viewModel: CharacterViewModel
    
    var body: some View {
        List {
            
        }.onAppear {
            self.viewModel.getCharacters()
        }
    }
}

struct CharctersList_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = APIService()
        let viewModel = CharacterViewModel(apiService: apiService)
        CharctersListView(viewModel: viewModel)
    }
}
