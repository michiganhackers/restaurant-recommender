//
//  RatingView.swift
//  Restaurant Recommender
//
//  Created by Eli Yazdi on 10/7/21.
//

import SwiftUI

struct RatingView: View {
    var rating: CGFloat

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.blue
    
    func ratio(number : Int) -> CGFloat{
        if(number > Int(floor(rating)) + 1){
            return 0.0
        }else if(number == Int(floor(rating)) + 1){
            return rating.truncatingRemainder(dividingBy: 1.0)
        }
        return 1.0
    }
    
    var body: some View {
        HStack {

            ForEach(1..<maximumRating + 1) { number in
                StarView(fillRatio: ratio(number: number))
            }.frame(width: 30, height: 30)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.5)
    }
}
