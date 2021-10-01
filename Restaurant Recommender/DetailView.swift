//
//  DetailView.swift
//  Restaurant Recommender
//
//  Created by Eli Yazdi on 9/23/21.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    var restaurant : Restaurant
    
    
    var body: some View {
//        LocationMapView(address: restaurant.Address)
        ScrollView{
            VStack(alignment: .leading){
                LocationMapView(address: restaurant.Address).ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                Text(restaurant.Name)
                    .padding(30)
                    .font(.title)
                VStack(alignment: .leading, spacing: 10){
                    ForEach(restaurant.Hours, id: \.self){ hours in
                        Text(hours)
                    }
                }.padding(20)
                Button(action:{
                    guard let number = URL(string: "tel://" + restaurant.Phone) else { return }
                    UIApplication.shared.open(number)
                }){
                    Image(systemName: "phone")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(30)
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( restaurant: restaurants[0])
    }
}
