//
//  CartView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/28/25.
//

import SwiftUI

struct CartView: View {
    @Environment(Cart.self) private var cartManager
    
    var body: some View {
        VStack {
            Section {
                List {
                    ForEach(cartManager.selection) { item in
                        CartItemRowView(cartItem: item)
                    }
                    .onDelete(perform: cartManager.remove)
                }
            }
            Section {
                HStack {
                    Spacer()
                    Text("Total \(cartManager.cartTotal, format: .currency(code: "USD"))")
                    Spacer()
                }
                .padding()
            }
            .padding()
            .background(.blue.opacity(0.2))
            HStack {
                Button("Cancel") {
                    
                }
                .padding()
                .bold()
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                
                Spacer()
                
                Button("Submit") {
                    
                }
                .padding()
                .bold()
                .background(.green)
                .foregroundStyle(.white)
                .clipShape(.capsule)
            }
            .padding()
        }
    }
}

#Preview {
    CartView()
        .environment(Cart())
}
