//
//  LocationMapView.swift
//  Restaurant Recommender
//
//  Created by Eli Yazdi on 9/30/21.
//

import SwiftUI
import CoreLocation
import MapKit

struct LocationMapView: View {
    
    var address : String
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                let geocoder = CLGeocoder();
                geocoder.geocodeAddressString(address) { (placemarks, error) in
                    if let placemark = placemarks?[0] {
                        let coordinate = CLLocationCoordinate2D(latitude: (placemark.location?.coordinate.latitude ?? 0.0)!, longitude: (placemark.location?.coordinate.longitude ?? 0.0)!)
                        setRegion(coordinate)
                    }
                }
                
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {

        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView(address : restaurants[0].Address)
    }
}
