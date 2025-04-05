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
            AccountButton()
            Spacer()
            Image(systemName: "menucard")
            Text("Menu")
            Spacer()
            Button {
                
            } label: {
                CartButton()
            }
        }
        .font(.title)
        .bold()
    }
    
}
