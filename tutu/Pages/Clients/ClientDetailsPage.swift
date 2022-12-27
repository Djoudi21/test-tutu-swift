//
//  ClientDetailsPage.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 24/12/2022.
//

import SwiftUI

struct ClientDetailsPage: View {
    var firstname: String
    var lastname: String
    var id: Int
    @State var showSheet: Bool = false
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            
            HStack {
                Text("Hello \(firstname)!")
                Text("Hello \(lastname)!")
                Text("Hello \(id)!")
            }
        }
        .sheet(isPresented: $showSheet) {
            AddClientPage(firstName: "", lastName: "", address: "")
        }
    }
}

struct ClientDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        ClientDetailsPage(firstname: "", lastname: "", id: 1)
    }
}
