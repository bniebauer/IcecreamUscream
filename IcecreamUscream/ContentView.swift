//
//  ContentView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    private let hostURLString = "https://niebauerwebapp.azurewebsites.net/icecream"
    private let debugURLString = "http://localhost:5000/api/List/icecream"
    
    @State private var options = [
        Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                
                List {
                    ForEach(options) { icecream in
                        NavigationLink(destination: IcecreamDetailView(icecream: icecream)) {
                            IcecreamRowView(icecream: icecream)
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            .padding()
            .toolbar {
                
            }
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: debugURLString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
#if DEBUG
            let stringData = String(data: data, encoding: .utf8) ?? "Could not decode data."
            print(stringData)
#endif
            if let decodedData = try? JSONDecoder().decode([Icecream].self, from: data) {
                options = decodedData
            } else {
                print("Could not decode data.")
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
