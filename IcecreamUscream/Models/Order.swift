//
//  Order.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import Foundation

struct Order: Identifiable, Codable {
    var id: String
    
    var selection: [CartItem]
    
    var price: Double {
        selection.reduce(0) { $0 + $1.total }
    }
}
