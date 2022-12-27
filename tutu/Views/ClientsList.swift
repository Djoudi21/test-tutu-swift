//
//  ClientsList.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 22/12/2022.
//

import SwiftUI

struct ClientsList: View {
    @EnvironmentObject var savedEntities: CoreDataViewModel
    @State var showSheet: Bool = false
    @State var firstName: String = ""
    @State var scrollToIndex: String = "5"

    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    SearchBar(toto: $firstName, scrollToIndex: $scrollToIndex)
                    ForEach(Array(savedEntities.savedClients.enumerated()), id: \.element){ index, item in
                        NavigationLink {
                            ClientDetailsPage(firstname: item.firstName ?? "", lastname: item.lastName ?? "", id: Int(item.id ))
                        } label: {
                           ClientCard(item: item)
                                .id(item.firstName)
                        }
                        .padding()
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
             .navigationBarItems(trailing: Button("TOTO", action: {
               showSheet = true
            }).padding(.top, 20))
            .sheet(isPresented: $showSheet) {
                AddClientPage(firstName: "", lastName: "", address: "")
           }

        }
    }
}


struct ClientsList_Previews: PreviewProvider {
    static var previews: some View {
        ClientsList()
    }
}
