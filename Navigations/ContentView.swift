//
//  ContentView.swift
//  Navigations
//
//  Created by Parth Antala on 2024-07-10.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack {
            
            NavigationStack(path: $path) {
                DetailView(number: 0, path: $path)
                    .navigationDestination(for: Int.self) { i in
                        DetailView(number: i, path: $path)
                    }
            }
        }
    }
}

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
      
 
}

#Preview {
    ContentView()
}
