//
//  Appetiser.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import Foundation



struct AppetiserResponse: Decodable {
    let request: [Appetiser]
}

struct Appetiser: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct MockData {
    
    // MARK: Appetiser list
    static let sampleAppetiser = Appetiser(id: 001,
                                           name: "Asian Flank Steak",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           calories: 99,
                                           protein: 38,
                                           carbs: 78)
    
    static let appetisers = [sampleAppetiser, sampleAppetiser, sampleAppetiser]
}
