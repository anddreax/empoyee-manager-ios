//
//  NewEmployee.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//

import UIKit
import Alamofire
import SwiftUI

class NewEmployeeController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descripcion: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var role: UITextField!
    //    TODO: desplegable roles
    let url: URLConvertible = URL(string:
    "http://localhost/bbdd/employee-manager/public/api/new")!
    let alertError = UIAlertController (title: "Error", message: "You don't have permission to do this action" , preferredStyle: UIAlertController.Style.alert)
    let alertFill = UIAlertController (title: "Error", message: "You must fill in alll the fields" , preferredStyle: UIAlertController.Style.alert)
    let alertEmail = UIAlertController (title: "Error", message: "The mail is already assigned to another account" , preferredStyle: UIAlertController.Style.alert)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alertFill.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alertEmail.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }

    @IBAction func register(_ sender: UIButton) {
        request()
    }
    
    func request (){
        let newEmployee = NewEmployee(name: name.text, description: descripcion.text, email: email.text, password: password.text,salary: Double(salary.text!), role: role.text)
        
        let api_token = UserDefaults.standard.value(forKey: "Api-Token")
        let urlToken: URLConvertible = URL(string:
        "http://localhost/bbdd/employee-manager/public/api/new?api_token=\(api_token!)")!
        AF.request(urlToken, method: .put, parameters: newEmployee, encoder: JSONParameterEncoder.default).responseDecodable(of: Response.self) {
            response in
            
            if(self.name.text == "" || self.descripcion.text == "" || self.email.text == "" || self.salary.text == "" || self.password.text == "" || self.role.text == ""){
                self.present(self.alertFill, animated: true, completion: nil)
            }else{
                if(response.value?.status == 0){
                    self.performSegue(withIdentifier: "register", sender: self)
                }else if(response.value?.status == 2){
                    self.present(self.alertEmail, animated: true, completion: nil)
                }else{
                    self.present(self.alertError, animated: true, completion: nil)
                }
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "register"{
            if segue.destination is HomeController{
                
            }
        }
    }
}
