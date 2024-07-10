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
    var body: some View {
        VStack {
            
            NavigationStack {
                List(0..<1000) { i in
                    NavigationLink("Tap Me \(i)", value: i)
                }
                .navigationDestination(for: Int.self) { selection in
                    DetailView(number: selection)
                }
                .navigationDestination(for: Student.self) { selection in
                    Text("Student Detail \(selection)")
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
