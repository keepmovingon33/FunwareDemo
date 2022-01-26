//
//  MainResponseDTO.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import Foundation

struct ItemResponseDTO: Decodable {
    let id: Int
    let description: String
    let title: String
    let image: String?
    let date: String
    let locationline1: String
    let locationline2: String
}

extension ItemResponseDTO {
    func toDomain() -> MainEntity {
        return .init(title: title,
                     description: description,
                     imageUrl: image,
                     date: dateValue,
                     location: location)
    }
    
    var location: String {
        return "\(locationline1), \(locationline2)"
    }
    
    var dateValue: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateTime = dateFormatter.date(from: date) ?? Date()
        return dateTime.toString()
    }
}
