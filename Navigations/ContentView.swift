//
//  ContentView.swift
//  Navigations
//
//  Created by Parth Antala on 2024-07-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            NavigationStack {
                List(0..<1000) { i in
                    NavigationLink("Tap Me") {
                        DetailView(number: i)
                    }
                }
            
            }
        }
        .padding()
    }
}

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    ContentView()
}
