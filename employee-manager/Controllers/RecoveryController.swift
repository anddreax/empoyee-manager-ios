//
//  RecoveryController.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//


import Alamofire
import SwiftUI
import UIKit

class RecoveryController: UIViewController {


    @IBOutlet weak var email: UITextField!
    let url: URLConvertible = URL(string:
    "http://localhost/bbdd/employee-manager/public/api/recoverypass")!
    let alertError = UIAlertController (title: "Error", message: "Enter an email" , preferredStyle: UIAlertController.Style.alert)
    let alertInvalid = UIAlertController (title: "Error", message: "User not found" , preferredStyle: UIAlertController.Style.alert)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }
    
    @IBAction func recoverPass(_ sender: UIButton) {
        request()
    }
    
    
    func request(){
        let resetPass = RecoveryPass(email: email.text!)
        AF.request(self.url, method: .post, parameters: resetPass, encoder: JSONParameterEncoder.default).responseDecodable(of: Response.self) {
            response in

            if(response.value?.status == 0){
                self.performSegue(withIdentifier: "recovered", sender: self)
            }else if (response.value?.status == 1){
                self.present(self.alertError, animated: true, completion: nil)
            }else if (response.value?.status == 2){
                self.present(self.alertInvalid, animated: true, completion: nil)
            }
            
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recovered"{
            if segue.destination is LoginController{
                
            }
        }
    }

}

