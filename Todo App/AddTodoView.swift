//
//  AddTodoView.swift
//  Todo App
//
//  Created by Harald Kurz on 24.01.24.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var task = ""
    @ObservedObject var todoList: TodoList
    @State var placeholderText = "What would you like to add?"
    
    var body: some View {
        
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 50)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .foregroundColor(.white)
                    .overlay(
                    TextField(placeholderText, text: $task)
                    .multilineTextAlignment(.center)
                    )
                
                Button {
                    if task == "" {
                        placeholderText = "Enter Text first!"
                    }
                    else {
                        todoList.addTodo(task: task)
                        todoList.showAddTodoView = false
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 300, height: 50)
                        .foregroundColor(.blue)
                        .overlay(
                            Text("Add Todo")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        )
                }
                .padding()
                
                Spacer()
            }
            .padding(.top, 35)
            .navigationTitle("Add a note")
        }
    }
}

#Preview {
    AddTodoView(todoList: TodoList())
}
