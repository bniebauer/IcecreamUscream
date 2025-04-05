//
//  MenuManager.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//

import Foundation

@Observable
class Menu {
    private let hostURLString = "https://niebauerwebapp.azurewebsites.net/icecream"
    private let debugURLString = "http://localhost:5000/api/List/icecream"
    
    var menuItems = [
        Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0),
        Icecream(id: UUID().uuidString, flavor: "Chocolate", basePrice: 2.0),
    ]
    
    
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
                menuItems = decodedData
            } else {
                print("Could not decode data.")
            }
        } catch {
            print("Invalid data")
        }
    }
}
