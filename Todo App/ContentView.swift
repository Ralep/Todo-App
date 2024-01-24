//
//  ContentView.swift
//  Todo App
//
//  Created by Harald Kurz on 24.01.24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoList: TodoList = TodoList()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoList.todos) { todo in
                        HStack {
                            Text(todo.task)
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    todoList.deleteTodo(todo: todo)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        todoList.showAddTodoView.toggle()
                    }, label: {
                        Text("Add Todo")
                    })
                }
            }
            .sheet(isPresented: $todoList.showAddTodoView, content: {
                AddTodoView(todoList: todoList)
            })
        }
    }
}

struct Todo : Identifiable, Equatable {
    var id = UUID()
    var task: String
}

class TodoList: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var showAddTodoView = false
    
    func addTodo(task: String) {
        todos.append(Todo(task: task))
    }
    
    func deleteTodo(todo: Todo) {
        if let index = todos.firstIndex(of: todo) {
            todos.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
