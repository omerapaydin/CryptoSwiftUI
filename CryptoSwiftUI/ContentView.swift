//
//  ContentView.swift
//  CryptoSwiftUI
//
//  Created by Ömer on 7.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cyrptoListViewModel: CryptoListViewModel
    
    init () {
        self.cyrptoListViewModel = CryptoListViewModel()
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(cyrptoListViewModel.cryptoList,id: \.id) { crypto in
                    Text(crypto.currency)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .bold()
                    Text(crypto.price)
                        .font(.callout)
                }.toolbar(content: {
                    Button {
                       
                        Task.init {
                            
                            await cyrptoListViewModel.downloadCryptoAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                        }
                    } label: {
                        Text("Refresh")
                            .font(.headline)
                            .foregroundStyle(.brown)
                    }

                })
            }.navigationTitle("Crypto List")
                .navigationBarTitleDisplayMode(.automatic)
        }.task {
            await cyrptoListViewModel.downloadCryptoAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
      
        
    }
}

#Preview {
    ContentView()
}
