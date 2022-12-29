//
//  CustomDatePicker.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 27/12/2022.
//

import SwiftUI

struct CustomDatePicker: View {
    @State var date = Date()
    var body: some View {
        NavigationView {
            Button("Press Me") {
                        print("Button pressed!")
                    }
                    .buttonStyle(BlueButton())
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}



struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
