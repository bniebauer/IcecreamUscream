//
//  CartItem.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import Foundation

struct CartItem: Identifiable, Codable {
    var id: String
    var icecream: Icecream
    
    var toppings: [String]
    var scoops: Int
    
    var total: Double {
        (icecream.basePrice * Double(scoops)) + (Double(toppings.count) * 0.5)
    }
}
