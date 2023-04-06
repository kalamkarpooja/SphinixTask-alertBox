//
//  Product.swift
//  SphinixSolutionTask1
//
//  Created by Mac on 06/04/23.
//

import Foundation
struct WelCome: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

