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
                VStack {
                    NavigationLink("Start", value: 0)
                }
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
        VStack {
            NavigationLink("Go to random number", value: Int.random(in: 0...1000))
                .navigationTitle("Number: \(number)")
                .toolbar {
                    Button("Home") {
                        path = NavigationPath()
                    }
                }
        }
        .navigationDestination(for: Int.self) { i in
            DetailView(number: i, path: $path)
        }
    }
      
 
}

#Preview {
    ContentView()
}
