//
//  AccountButton.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import SwiftUI

struct AccountButton: View {
    var body: some View {
        NavigationLink(destination: AccountDetailView()) {
            Image(systemName: "person.circle")
                .bold()
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    AccountButton()
}
