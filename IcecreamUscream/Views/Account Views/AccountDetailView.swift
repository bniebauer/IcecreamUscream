//
//  AccountDetailView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import SwiftUI

struct AccountDetailView: View {
    @State private var account = Account()

    
    var body: some View {
        Form {
            TextField("First Name", text: $account.user.firstName)
            TextField("Last Name", text: $account.user.lastName)
            TextField("Email", text: $account.user.email)
        }
        .padding(20)
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AccountDetailView()
    }
}
