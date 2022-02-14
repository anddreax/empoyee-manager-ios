//
//  File.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//

import Foundation

struct Response: Decodable {
    let status: Int?
    let msg: String?
    let data: [ViewEmployee]?
    let employee: DetailsEmployee?
    
    enum CodingKeys: String, CodingKey {
        case status
        case msg
        case data
        case employee
    }
}
