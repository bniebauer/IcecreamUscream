//
//  CartButton.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import SwiftUI

struct CartButton: View {
    var body: some View {
        NavigationLink(destination: CartView()) {
            Image(systemName: "cart")
                .bold()
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    CartButton()
}
