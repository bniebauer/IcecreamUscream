//
//  CartManager.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/30/25.
//

import Foundation

@Observable
class Cart {
    private(set) var selection: [CartItem]
    
    init() {
        self.selection = []
    }
    
    var cartTotal: Double {
        selection.map { $0.total }.reduce(0, +)
    }
    
    // MARK: Public Methods
    
    /// Add new cart items to the cart
    func addToCart(_ cartItem: CartItem) {
        selection.append(cartItem)
    }
    
    /// Remove cart items based on their Index in the collection
    func remove(at offset: IndexSet) {
        selection.remove(at: offset.first!)
    }
    
    // TODO: Add a method to submit an order

}
