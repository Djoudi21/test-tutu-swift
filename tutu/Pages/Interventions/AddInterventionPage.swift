//
//  AddInterventionPage.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 28/12/2022.
//

import SwiftUI

struct AddInterventionPage: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var savedEntities: CoreDataViewModel

    @Binding var date: Date
    @Binding var title: String

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "clear")
                        .font(.largeTitle)
                        .padding(.top, 10)
                        .foregroundColor(Color.gray)
                        .opacity(0.8)
                }
                .padding()
            }
            Spacer()
            VStack {
                LazyHStack {
                    DatePicker("tutu", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.automatic)
                    
                }
                
                VStack {
                    ForEach(savedEntities.savedInterventions) { intervention in
                        HStack {
                            Text("\(intervention.title ?? "")")
                            Text("\(intervention.client?.firstName ?? "toto")")
                        }
                         Form {
                             TextField("Title", text: $title)
                         }
                         
                         Button {
                             handleButtonPressed()
                         } label: {
                             Text("Press")
                         }
                    }
                }
            }
        }
    }
    func handleButtonPressed() {
        savedEntities.addIntervention(title: title, date: date)
    }
}

/*struct AddInterventionPage_Previews: PreviewProvider {
    static var previews: some View {
        AddInterventionPage(date: $date, title: )
    }
}*/
