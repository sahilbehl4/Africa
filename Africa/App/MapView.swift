//
//  MapView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-10.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [Location] = (try? Bundle.main.decode(from: "locations")) ?? []
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationVIew(location: item)
            }
        }.overlay(
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: "safari")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.black
                            .cornerRadius(8)
                            .opacity(0.6))
                .padding()
            ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
