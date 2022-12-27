//
//  ClientCard.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 27/12/2022.
//

import SwiftUI

struct ClientCard: View {
    var item: ClientEntity

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text( item.firstName ?? "")
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Text(item.lastName ?? "NO id")
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding()
            Spacer()
            Text( item.address ?? "No addrress added")
            Spacer()
      }
        .frame(width: 400, height: 200)
        .background(RoundedRectangle(cornerRadius: 10, style: .circular).fill(Color.white).shadow(radius: 3))
    }
}

//struct ClientCard_Previews: PreviewProvider {
   // static var previews: some View {
   //     ClientCard(firstName: <#T##String#>, lastName: <#T##String#>, address: <#T##String#>, item: <#T##ClientEntity#>)
  //  }
//}
