//
//  Restaurant.swift
//  Restaurant Recommender
//
//  Created by Thomas Smith on 9/16/21.
//

import CoreLocation

struct Restaurant : Decodable, Identifiable {
    let Id : Int
    let Name: String
    let Rating : Double
    let Price : Int
    let Types : [String]
    let Hours : [String]
    let Address : String
    let Phone : String
    
//    let description: String
//    var totalStars: Int
//    var numRatings: Int
//    var userRating: Int?
//    let favorited: Bool
//    let location: CLLocation
    
//    var averageRating: Double? {
//        guard numRatings > 0 else {
//            return nil
//        }
//        return Double(totalStars) / Double(numRatings)
//    }
//
//    mutating func rate(_ rating: Int?) {
//        if let oldUserRating = userRating {
//            // Remove the old user rating
//            userRating = nil
//            numRatings -= 1
//            totalStars -= oldUserRating
//        }
//        if let newRating = rating {
//            // Add the new user rating
//            userRating = newRating
//            numRatings += 1
//            totalStars += newRating
//        }
//    }
}
