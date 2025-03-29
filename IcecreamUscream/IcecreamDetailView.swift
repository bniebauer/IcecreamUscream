//
//  IcecreamDetailView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct IcecreamDetailView: View {
    let icecream: Icecream
    @State private var numOfScoops = 1
    @State private var selectedToppings: [String] = []
    
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    private var total: Double {
        icecream.basePrice * Double(numOfScoops) + (Double(selectedToppings.count) * 0.5)
    }
    
    var body: some View {
        Form {
            Text(icecream.flavor)
                .font(.system(size: 38))
                .bold()
            
            Picker("Number of scoops", selection: $numOfScoops) {
                ForEach(1...3, id: \.self) { num in
                    Text("\(num) Scoop\(num > 1 ? "s" : "")")
                        .tag(num)
                }
            }
            
            Picker("Toppings", selection: $selectedToppings) {
                
            }
            
            Section {
                Text("Total: \(total, format: .currency(code: "USD"))")
                    .bold()
            }
            
           
            Button("Add To Cart") {
                addToCartPressed()
            }
                    
//                    Image(uiImage: qrCode)
//                        .interpolation(.none)
//                        .resizable()
//                        .scaledToFit()
            
        }
    }
    
    func addToCartPressed() {
        var cartItem = CartItem(icecream: icecream, toppings: selectedToppings, scoops: numOfScoops)
        
    }
    
    func updateQRCode() {
//        let order = Order(id: UUID().uuidString, icecream: icecream, toppings: selectedToppings, scoops: numOfScoops)
//        
//        if let data = try? JSONEncoder().encode(order) {
//            let jsonString = String(data: data, encoding: .utf8)!
//            qrCode = generateQRCode(from: jsonString)
//        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                qrCode = UIImage(cgImage: cgImage)
                return qrCode
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    IcecreamDetailView(icecream: Icecream(id: UUID().uuidString, flavor: "Vanilla", basePrice: 2.0))
}
