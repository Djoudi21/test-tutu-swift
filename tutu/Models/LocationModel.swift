//
//  LocationModel.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 29/12/2022.
//

import Foundation
import MapKit


struct Location: Identifiable {
    let coordinates: CLLocationCoordinate2D
    let cityName: String
    let id: Int
}
