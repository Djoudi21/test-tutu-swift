//
//  ClientsPage.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 22/12/2022.
//

import SwiftUI

struct ClientsPage: View {
    @StateObject var savedEntities: CoreDataViewModel = CoreDataViewModel()

    var body: some View {
        NavigationView {
            ClientsList()
        }
    }
}

struct ClientsPage_Previews: PreviewProvider {
    static var previews: some View {
        ClientsPage()
    }
}
