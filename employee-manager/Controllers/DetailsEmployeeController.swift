//
//  DetailsEmployeeController.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 9/2/22.
//

import UIKit
import Alamofire

class DetailsEmployeeController: UIViewController {

    var employee: DetailsEmployee?
    var employeeID: Int?
    
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeRole: UILabel!
    @IBOutlet weak var employeeDescription: UILabel!
    @IBOutlet weak var employeeSalary: UILabel!
    @IBOutlet weak var employeeEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        request()
    }
    
    func request (){
        let api_token = UserDefaults.standard.value(forKey: "Api-Token")
        let urlToken: URLConvertible = URL(string:
        "http://localhost/bbdd/employee-manager/public/api/listbyID/\(employeeID!)?api_token=\(api_token!)")!
        print(employeeID!)
        AF.request(urlToken, method: .get).responseDecodable(of: Response.self){
            response in
            
            guard let employee = response.value?.employee! else { return }
            
            if let salary = employee.salary,  let name = employee.name, let role = employee.role, let desc = employee.description, let email = employee.email {
                
                self.employee = employee
                self.employeeName.text = name
                self.employeeRole.text = role
                self.employeeDescription.text = desc
                self.employeeEmail.text = email
                self.employeeSalary.text = String(salary)
            }
        }
    }

}

