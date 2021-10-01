//
//  RestaurantListView.swift
//  Restaurant Recommender
//
//  Created by Vu Trinh on 9/30/21.
//

import SwiftUI

struct RestaurantListView: View {
    var body: some View {
        NavigationView {
            VStack {
                List(restaurants) {
                    r in
                    HStack {
                        NavigationLink(destination: DetailView(restaurant: r), label: HStack(spacing: 20) {
                            Image(systemName: "star")
                            VStack {
                                Text(r.Name)
                                HStack(spacing: 5) {
                                }
                                
                            }
                        })
                        
                    }
                }
            }
        }.navigationTitle(Text("Restaurants List"))
    }
}


struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
