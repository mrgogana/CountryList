//
//  CountryModel.swift
//  Countries
//
//  Created by Navpreet Gogana on 2023-02-13.
//

import Foundation

struct Country: Decodable, Hashable {
    let capital: String
    let code: String
    let flag: String
    let name: String
    let region: String
    let currency: Currency
    let language: Language
}

struct Currency: Decodable, Hashable {
    let name: String
    let code: String
    let symbol: String?
}

struct Language: Decodable, Hashable {
    let name: String
    let code: String?
}
