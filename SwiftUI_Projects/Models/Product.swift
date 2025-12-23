//
//  Welcome.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 10/12/2025.
//


import Foundation

// MARK: - Welcome
struct ProductsResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20250430T094102053Z = "2025-04-30T09:41:02.053Z"
}
