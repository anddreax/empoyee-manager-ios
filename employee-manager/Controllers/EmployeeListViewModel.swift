//
//  EmployeeListViewModel.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 9/2/22.
//

import Foundation
import Alamofire

class EmployeeListViewModel {
    private var employeeList = [ViewEmployee]()
    
    func fetchEmployeeList(completion: @escaping () -> ()) {
        NetworkingRequest.shared.employeeList { data, status, msg in
            if let responseList = data {
                self.employeeList = responseList
                completion()
            }
        } failure: { error in
            debugPrint(error)
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if employeeList.count != 0 {
            return employeeList.count
        }
        
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> ViewEmployee {
        return employeeList[indexPath.row]
    }
}
