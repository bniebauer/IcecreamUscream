//
//  IcecreamRowView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import SwiftUI

struct IcecreamRowView: View {
    let icecream: Icecream
    
    var body: some View {
        HStack {
            Text(icecream.flavor)
            Spacer()
            Text("\(icecream.basePrice, format: .currency(code: "USD"))")
        }
    }
}

#Preview {
    IcecreamRowView(icecream: Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0))
}
