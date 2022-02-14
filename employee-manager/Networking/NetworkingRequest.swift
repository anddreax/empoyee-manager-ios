//
//  NetworkingRequest.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 8/2/22.
//

import Foundation
import Alamofire

final class NetworkingRequest {
    static let shared = NetworkingRequest()
    
    func employeeList(responseData: @escaping (_ data: [ViewEmployee]?, _ status: Int?, _ msg: String?) -> (), failure: @escaping (_ error: Error) -> ()) {
        
        let api_token = UserDefaults.standard.value(forKey: "Api-Token")
        let urlToken: URLConvertible = URL(string:
                                            "http://localhost/bbdd/employee-manager/public/api/list?api_token=\(api_token!)")!
        
        AF.request(urlToken, method: .get).responseDecodable(of: Response.self) {
            response in
            
            if let data = response.value?.data, let statusCode = response.value?.status, let msg = response.value?.msg {
                responseData(data, statusCode, msg)
            }
            
            if let error = response.error {
                failure(error)
            }
        }
    }
}

