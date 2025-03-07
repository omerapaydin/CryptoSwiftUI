//
//  CyrptoCurrency.swift
//  CryptoSwiftUI
//
//  Created by Ömer on 7.03.2025.
//

import Foundation

struct CyrptoCurrency: Decodable, Identifiable {
    var id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
