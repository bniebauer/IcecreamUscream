//
//  CartItemRowView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import SwiftUI

struct CartItemRowView: View {
    var cartItem: CartItem
    var body: some View {
        HStack {
            
            Image(cartItem.icecream.imageString)
                .resizable()
                .frame(width: 75, height: 75)
            
            Text(cartItem.icecream.flavor)
            
            Spacer()
            
            VStack {
                Text("Scoops: \(cartItem.scoops)")
                Text("Toppings: \(cartItem.toppings.joined(separator: ", "))")
            }
            
            Spacer()
            
            Text("\(cartItem.total, format: .currency(code: "USD"))")
        }
    }
}

#Preview {
    let cartItem = CartItem(id: UUID().uuidString, icecream: Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0), toppings: [], scoops: 3)
    CartItemRowView(cartItem: cartItem)
}
