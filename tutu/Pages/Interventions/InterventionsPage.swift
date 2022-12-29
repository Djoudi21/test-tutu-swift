//
//  InterventionsPage.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 24/12/2022.
//

import SwiftUI
import MapKit

struct InterventionsPage: View {
    @EnvironmentObject var savedEntities: CoreDataViewModel
    
    @State var showSheet: Bool = false
    @State var title: String = ""
    @State var date: Date = Date()
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.887384, longitude: 2.218577), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State var location: Location = Location(coordinates: CLLocationCoordinate2D(latitude: 49.100354, longitude: 0.591265), cityName: "nanterre", id: 1)
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region)
                    .ignoresSafeArea(.all)
                ZStack {
                    Button {
                        print("map")
                    } label: {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 50))
                            .foregroundColor(Color.red)
                    }
                }
            }.navigationBarItems(trailing: Button(action: {
                showSheet = true
            }, label: {
                Image(systemName: "pencil.circle")
                    .font(.system(size: 30))
                    .padding(.top)
            }))
            .sheet(isPresented: $showSheet) {
                AddInterventionPage(date: $date, title: $title)
            }
        }
    }
}

struct InterventionsPage_Previews: PreviewProvider {
    static var previews: some View {
        InterventionsPage(title: "toto", date: Date())
            .environmentObject(CoreDataViewModel())
    }
}
