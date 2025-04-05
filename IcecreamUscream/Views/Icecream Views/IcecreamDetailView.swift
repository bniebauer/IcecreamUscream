//
//  IcecreamDetailView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import SwiftUI

struct IcecreamDetailView: View {
    @Environment(Cart.self) private var cartManager
    
    let icecream: Icecream
    @State private var numOfScoops = 1
    @State private var selectedToppings: [String] = []
    
    private var total: Double {
        icecream.basePrice * Double(numOfScoops) + (Double(selectedToppings.count) * 0.5)
    }
    
    var body: some View {
            Form {
                HStack {
                    Image(icecream.imageString)
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text(icecream.flavor)
                        .font(.system(size: 38))
                        .bold()
                }
                Picker("Number of scoops", selection: $numOfScoops) {
                    ForEach(1...3, id: \.self) { num in
                        Text("\(num) Scoop\(num > 1 ? "s" : "")")
                            .tag(num)
                    }
                }
                
                Picker("Toppings", selection: $selectedToppings) {
                    
                }
                
                Section {
                    Text("Total: \(total, format: .currency(code: "USD"))")
                        .bold()
                }
                
                
                Button("Add To Cart") {
                    addToCartPressed()
                }
                
            }
            .toolbar {
                CartButton()
            }
    }
    
    func addToCartPressed() {
        let cartItem = CartItem(id: UUID().uuidString, icecream: icecream, toppings: selectedToppings, scoops: numOfScoops)
        
        cartManager.addToCart(cartItem)
    }
    
}

#Preview {
    NavigationStack {
        IcecreamDetailView(icecream: Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0))
            .environment(Cart())
    }
}
