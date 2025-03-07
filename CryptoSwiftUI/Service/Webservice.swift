//
//  Webservice.swift
//  CryptoSwiftUI
//
//  Created by Ömer on 7.03.2025.
//

import Foundation

class Webservice {
    
    
    func downloadCurrenciesAsync(url:URL) async throws -> [CyrptoCurrency] {
        let ( data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CyrptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    
    
    
}
