//
//  RecoveryPass.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//

import Foundation

struct RecoveryPass: Encodable {
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case email
    }
}
