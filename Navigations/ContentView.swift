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
                List(0..<4) { i in
                    NavigationLink("Tap Me \(i)", value: i)
                }
                List(0..<4) { i in
                    NavigationLink("String \(i)", value: String(i))
                }
                .navigationDestination(for: Int.self) { selection in
                    DetailView(number: selection)
                }
                .navigationDestination(for: String.self) { selection in
                    Text("String \(selection)")
                }
                .toolbar {
                    Button("show 666") {
                        path.append(666)
                    }
                    
                    Button("show String") {
                        path.append("String")
                    }
                }
            
            }
        }
        
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
