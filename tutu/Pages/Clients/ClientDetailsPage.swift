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
    var index: Int
    var savedEntities: CoreDataViewModel
    let entity: ClientEntity
    
    @State var showSheet: Bool = false
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            
            VStack {
                HStack {
                    Text("Hello \(firstname)!")
                    Text("Hello \(lastname)!")
                    Text("Hello \(id)!")
                }
                
                if let interventions = entity.interventions?.allObjects as? [InterventionEntity] {
                    VStack {
                        Text("Interventions: ")
                         
                         ForEach(interventions) { intervention in
                             Text("titiit\(interventions.count)")
                             Text("\(intervention.title ?? "title")")
                         }
                    }
                }
                
                Button {
                    handleButtonPressed()
                } label: {
                    Text("DELETE")
                }

            }
        }
    }
    
    func handleButtonPressed() {
        savedEntities.removeClient(index: index)
    }
}

//struct ClientDetailsPage_Previews: PreviewProvider {
    //static var previews: some View {
       // ClientDetailsPage(firstname: "", lastname: "", id: 1, indexSet: 1)
    //}
//}
