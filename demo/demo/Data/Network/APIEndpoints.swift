//
//  APIEndpoints.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import Foundation

struct APIEndpoints {
    static func getItems() -> Endpoint<[ItemResponseDTO]> {
        return Endpoint(path: "", method: .get)
    }
}
