//
//  CartView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/28/25.
//

import SwiftUI

struct CartView: View {
    @State private var selection: [CartItem] = []
    
    
    var body: some View {
        VStack {
            Section {
                ForEach(selection, id: \.icecream.flavor) { item in
                    Text(item.icecream.flavor)
                }
            }
            Section {
                HStack {
                    Text("Total")
                }
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
}
