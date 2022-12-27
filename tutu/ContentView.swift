//
//  ContentView.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 21/12/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<ClientEntity>
    
    var body: some View {
        TabView {
            ClientsPage()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Clients")
            }
            
            InterventionsPage()
                .tabItem {
                    Image(systemName: "map")
                    Text("Clients")
            }
            
            ReportsPage()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Clients")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
