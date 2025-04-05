//
//  IcecreamUscreamApp.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import SwiftUI

@main
struct IcecreamUscreamApp: App {
    @State private var cartManager = Cart()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cartManager)
        }
    }
}
