//
//  ContentView.swift
//  Todo App
//
//  Created by Harald Kurz on 24.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0...3, id: \.self) { todo in
                        Text("Hello")
                    }
                }
            }
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //
                    }, label: {
                        Text("Add Todo")
                    })
                }
            }
        }
    }
}

struct Todo : Identifiable, Equatable {
    var id = UUID()
    var task: String
}

#Preview {
    ContentView()
}
