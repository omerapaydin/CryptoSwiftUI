//
//  CryptoViewModel.swift
//  CryptoSwiftUI
//
//  Created by Ömer on 7.03.2025.
//

import Foundation

class CryptoListViewModel: ObservableObject {

    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    
    func downloadCryptoAsync(url: URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
        }catch {
            print(error)
        }
        
    }
    }
   



struct CryptoViewModel {
    
    let crypto: CyrptoCurrency
    
    var id : UUID {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
    
    
}
