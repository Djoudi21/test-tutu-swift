//
//  AddClientPage.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 22/12/2022.
//

import SwiftUI

struct AddClientPage: View {
    @EnvironmentObject var coreDataViewModel: CoreDataViewModel
    @Environment(\.presentationMode) var presentationMode

    @State var firstName: String
    @State var lastName: String
    @State var address: String

    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "clear")
                        .font(.largeTitle)
                        .padding(.top, 10)
                        .foregroundColor(Color.gray)
                        .opacity(0.8)
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            .font(.system(size: 30))
            .opacity(0.5)

            Form {
                Section {
                    TextField("first name", text: $firstName)
                    Spacer()
                    TextField("last name", text: $lastName)
                    Spacer()
                    TextField("address", text: $address)
                }
                Section {
                    Button("Add") {
                        handleButtonPressed()
                    }
                }
            }
        }
    }
    
    func handleButtonPressed() {
        coreDataViewModel.addClient(firstName: firstName, lastName: lastName, address: address)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddClientPage_Previews: PreviewProvider {
    static var previews: some View {
        AddClientPage(firstName: "", lastName: "", address: "")
    }
}
