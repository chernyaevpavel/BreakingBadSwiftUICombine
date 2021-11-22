//
//  CharctersList.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import SwiftUI

struct CharctersList: View {
    @ObservableObject var viewModel: CharacterViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CharctersList_Previews: PreviewProvider {
    static var previews: some View {
        CharctersList()
    }
}
