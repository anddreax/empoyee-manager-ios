//
//  NewEmployee.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//

import Foundation

struct NewEmployee: Encodable {
    let name: String?
    let description: String?
    let email: String?
    let password: String?
    let salary: Double?
    let role: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case email
        case password
        case salary
        case role
    }
}
