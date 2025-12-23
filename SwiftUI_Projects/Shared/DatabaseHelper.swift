//
//  DatabaseHelper.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 10/12/2025.
//

import Foundation

struct DatabaseHelper {
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else { throw URLError(.badURL) }
            
        let (data, _) = try await URLSession.shared.data(from: url)
        let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
        return productsResponse.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else { throw URLError(.badURL) }
            
        let (data, _) = try await URLSession.shared.data(from: url)
        let usersResponse = try JSONDecoder().decode(UsersResponse.self, from: data)
        return usersResponse.users
    }
}
