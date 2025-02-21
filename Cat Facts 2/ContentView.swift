//
//  ContentView.swift
//  Cat Facts 2
//
//  Created by Paul Klauser on 2/20/25.
//

import SwiftUI
import Shared

struct ContentView: View {
    let viewModel = SharedViewModel()
    
    var body: some View {
        Observing(viewModel.uiState) { state in
            VStack {
                switch onEnum(of: state) {
                case .initial:
                    Text("Tap Button")
                case .loading:
                    Text("Loading...")
                case .success(let success):
                    Text(success.catFact)
                }
                
                Button("Fetch") {
                    viewModel.fetchCatFact()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
