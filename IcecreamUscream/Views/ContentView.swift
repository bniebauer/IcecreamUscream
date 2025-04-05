//
//  ContentView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var menu = Menu()
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                
                List {
                    ForEach(menu.menuItems) { icecream in
                        NavigationLink(destination: IcecreamDetailView(icecream: icecream)) {
                            IcecreamRowView(icecream: icecream)
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            .padding()
            .onAppear {
                Task {
                    await menu.loadData()
                }
            }
        }
    }

}

#Preview {
    ContentView()
        .environment(Cart())
}
