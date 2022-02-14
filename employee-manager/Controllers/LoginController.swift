//
//  LoginController.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 19/1/22.
//

import UIKit
import Alamofire
import SwiftUI

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass: UITextField!
    let url: URLConvertible = URL(string:
    "http://localhost/bbdd/employee-manager/public/api/login")!
    let alertError = UIAlertController (title: "Error", message: "Username or Password Incorrect" , preferredStyle: UIAlertController.Style.alert)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }
    
    @IBAction func SignIn(_ sender: UIButton) {
        request()
    }
    

    func request (){
        let userLogin = UserLogin(email: username.text, password: pass.text)
        
        AF.request(self.url, method: .post, parameters: userLogin, encoder: JSONParameterEncoder.default).responseDecodable(of: Response.self) {
            response in
            
            if(response.value?.status == 0){
                UserDefaults.standard.removeObject(forKey: "Api-Token")
                UserDefaults.standard.set(response.value?.msg, forKey: "Api-Token")
//                Enviar token
                print(UserDefaults.standard.value(forKey: "Api-Token"))
                
                    self.performSegue(withIdentifier: "login", sender: self)
            }else{
                self.present(self.alertError, animated: true, completion: nil)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login"{
            if segue.destination is HomeController{
                
            }
        }
    }
    
    

}

