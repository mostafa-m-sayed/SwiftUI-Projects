//
//  ContentView.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 09/12/2025.
//

import SwiftUI
import SwiftData
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @State private var products: [Product] = []
    @State private var users: [User] = []
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    ForEach(users) { user in
                        Text(user.firstName)
                    }
                }
                .padding()
                VStack {
                    ForEach(products) { user in
                        Text(user.title)
                    }
                }
                .padding()
            }
            
            .task {
                await getData()
            }
        }
    }
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
            users = try await DatabaseHelper().getUsers()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

#Preview {
    ContentView()
    
}
