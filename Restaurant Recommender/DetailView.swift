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
        ScrollView{
            VStack(alignment: .leading){
                LocationMapView(address: restaurant.Address).ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                Group{
                    Text(restaurant.Name)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .font(.title)
                    HStack{
                        RatingView(rating: restaurant.Rating)
                        PriceView(price: restaurant.Price)
                            .padding(.leading, 10)
                    }
                    VStack(alignment: .leading, spacing: 10){
                        ForEach(restaurant.Hours, id: \.self){ hours in
                        Text(hours)
                    }
                    }.padding(.top, 10)
                    HStack{
                        Button(action:{
                            guard let number = URL(string: "tel://" + restaurant.Phone) else { return }
                            UIApplication.shared.open(number)
                        }){
                            Image(systemName: "phone")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action:{
                            guard let number = URL(string: "http://maps.apple.com/?q=" + restaurant.Address) else { return }
                            UIApplication.shared.open(number)
                        }){
                            Image(systemName: "location")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.padding(.leading, 20)
                    }.padding(.top, 10)
                }
                .padding(.leading, 20)
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( restaurant: restaurants[0])
    }
}
