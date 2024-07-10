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

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "savedPath")
    
    init() {
        
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representaion = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representaion)
            try data.write(to: savePath)
            
        } catch {
            print("failed to save navigation data")
        }
    }
    
    func home() {
        path = NavigationPath()
    }
}

struct ContentView: View {
    
    @State private var pathStore = PathStore()
    
    var body: some View {
        VStack {
            NavigationStack(path: $pathStore.path) {
                DetailView(number: 0)
                            .navigationDestination(for: Int.self) { i in
                                DetailView(number: i)
                                    .toolbar {
                                        Button("Home") {
                                            pathStore.path = NavigationPath()
                                        }
                                    }
                            }
                            
                    }
        }
        
    }
}

struct DetailView: View {
    
   

    var number: Int
    var body: some View {
        VStack {
            NavigationLink("Go to random number", value: Int.random(in: 0...1000))
                .navigationTitle("Number: \(number)")
                
                
        }
    }
      
 
}

#Preview {
    ContentView()
}
