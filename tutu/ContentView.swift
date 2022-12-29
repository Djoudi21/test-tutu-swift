//
//  ContentView.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 21/12/2022.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<ClientEntity>
    @FetchRequest(sortDescriptors: []) var interventions: FetchedResults<InterventionEntity>
    @StateObject var coreDataViewModel: CoreDataViewModel = CoreDataViewModel()
    
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
        .environmentObject(coreDataViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
