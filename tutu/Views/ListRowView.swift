//
//  ListRowView.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 22/12/2022.
//

import SwiftUI

struct ListRowView: View {
    var firstName: String
    var lastName: String

    var body: some View {
        ScrollView {
            HStack {
                Text(firstName)
                Text(lastName)
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(firstName: "TOTO", lastName: "TOTO")   }
}
