//
//  Model.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 23/08/2022.
//


import Foundation

// MARK: - CartModel
struct CartModel: Codable {
    let basket: [Basket]
    let delivery, id: String
    let total: Int
}

// MARK: - Basket
struct Basket: Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}

// MARK: - DetailsVC
struct DetailsVC: Decodable {
    let cpu, camera: String
    let capacity, color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd, ssd, title: String

    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
}


// MARK: - Ecommerce
struct Ecommerce: Decodable {
    let homeStore: [HomeStore]
    let bestSeller: [BestSeller]

    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}

// MARK: - BestSeller
struct BestSeller: Decodable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount, discountPrice: Int
    let picture: String

    enum CodingKeys: String, CodingKey {
        case id
        case isFavorites = "is_favorites"
        case title
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture
    }
}

// MARK: - HomeStore
struct HomeStore: Decodable {
    let id: Int
    let isNew: Bool?
    let title, subtitle: String
    let picture: String
    let isBuy: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title, subtitle, picture
        case isBuy = "is_buy"
    }
}

struct Categorystr {
    var name: String
    var imageName: String
}

