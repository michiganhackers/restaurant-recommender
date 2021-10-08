//
//  PriceView.swift
//  Restaurant Recommender
//
//  Created by Eli Yazdi on 10/7/21.
//

import SwiftUI

struct PriceView: View {
    var price : Int
    
    var body: some View {
        HStack {
            ForEach(1..<4) { number in
                Text("$")
                    .foregroundColor(number > self.price ? .gray : .black)
            }
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: 2)
    }
}
