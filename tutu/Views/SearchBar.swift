//
//  SearchBar.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 27/12/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var toto: String
    @Binding var scrollToIndex: String

    var body: some View {
        HStack {
            TextField("Ener a username", text: $toto)
            Button {
                let index = "10"
                scrollToIndex = toto
            } label: {
                Image(systemName: "magnifyingglass")
                    .opacity(0.5)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10, style: .circular).fill(Color.white).shadow(radius: 3))
        .padding()
    }
}

