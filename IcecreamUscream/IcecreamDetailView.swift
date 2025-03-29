//
//  IcecreamDetailView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import SwiftUI

struct IcecreamDetailView: View {
    let icecream: Icecream
    @State private var numOfScoops = 1
    @State private var selectedToppings: [String] = []
    
    private var total: Double {
        icecream.basePrice * Double(numOfScoops) + (Double(selectedToppings.count) * 0.5)
    }
    
    var body: some View {
        Form {
            Text(icecream.flavor)
                .font(.system(size: 38))
                .bold()
            
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
    }
    
    func addToCartPressed() {
        let cartItem = CartItem(icecream: icecream, toppings: selectedToppings, scoops: numOfScoops)
        // TODO: add cart item to Order
    }
    
}

#Preview {
    IcecreamDetailView(icecream: Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0))
}
