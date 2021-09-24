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
            VStack{
                Text(restaurant.Name)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( restaurant: restaurants[0])
    }
}
