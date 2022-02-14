//
//  File.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 8/2/22.
//

import Foundation

struct ViewEmployee: Decodable{
    let id: Int?
    let name: String?
    let salary: Int?
    let role: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case salary
        case role
    }
}
