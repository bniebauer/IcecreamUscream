//
//  HeaderView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/28/25.
//
import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "menucard")
            Text("Menu")
            Spacer()
            Button {
                
            } label: {
                NavigationLink(destination: CartView()) {
                    Image(systemName: "cart")
                        .bold()
                        .foregroundStyle(.green)
                }
            }
        }
        .font(.title)
        .bold()
    }
    
}
