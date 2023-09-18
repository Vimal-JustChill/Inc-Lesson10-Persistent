//
//  ContentView.swift
//  Lesson_10
//
//  Created by Nagarajan Vimal balaji on 18/09/23.
//

import SwiftUI
import SwiftPersistence

struct person: Codable, Identifiable{
    var id = UUID()
    var name: String
    var age: Int
    var money: Double
    var isMale: Bool
}

struct ContentView: View {
    
    @State var count = 1
    @Persistent ("todoItems") var todoItems: [person] = []
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(todoItems, id: \.id){ item in
                    Text(item.name)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        todoItems = []
                        count = 1
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                    
                    
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        todoItems.append(person(name: "Vimal", age: 14, money: 50, isMale: true))
                        count += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
