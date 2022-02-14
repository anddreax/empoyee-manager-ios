//
//  EmployeeLogin.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//

import Foundation

struct UserLogin: Encodable {
    let email: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}
