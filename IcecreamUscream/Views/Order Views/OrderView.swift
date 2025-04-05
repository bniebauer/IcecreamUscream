//
//  OrderView.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/28/25.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct OrderView: View {
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Image(uiImage: qrCode)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
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
    OrderView()
}
