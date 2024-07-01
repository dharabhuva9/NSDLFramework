//
//  ModelUser.swift
//  TestNSDL
//
//  Created by Dhara Bhuva on 06/06/24.
//

import Foundation

public struct ModelUserDetails: Codable {
    public let page: Int
    public let perPage: Int
    public let total: Int
    public let totalPages: Int
    public let data: [ModelUser]
    public let support: ModelSupport

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}

public struct ModelUser: Codable {
    public let id: Int
    public let email: String
    public let firstName: String
    public let lastName: String
    public let avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

public struct ModelSupport: Codable {
    public let url: String
    public let text: String
}

