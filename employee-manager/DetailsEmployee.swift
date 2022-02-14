//
//  DetailsEmployee.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 11/2/22.
//

import Foundation
struct DetailsEmployee: Decodable{
    let id: Int?
    let name: String?
    let salary: Int?
    let role: String?
    let email: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case salary
        case role
        case email
        case description
    }
}
