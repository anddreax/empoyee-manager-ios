//
//  HomeController.swift
//  employee-manager
//
//  Created by Andrea Martinez Bartolome on 26/1/22.
//

import UIKit
import Alamofire

class HomeController: UIViewController{
    
    @IBOutlet weak var EmployeeTableVIew: UITableView!
    
    private var employeeViewModel = EmployeeListViewModel()
    private var employee: ViewEmployee?
    var employeeID: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        request()
    }
    
    func request() {
        employeeViewModel.fetchEmployeeList { [weak self] in
            self?.EmployeeTableVIew.dataSource = self
            self?.EmployeeTableVIew.delegate = self
            self?.EmployeeTableVIew.reloadData()
        }
    }

}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as! EmployeeCell
        
        cell.EmployeeName.text = employeeViewModel.cellForRowAt(indexPath: indexPath).name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeID = employeeViewModel.cellForRowAt(indexPath: indexPath).id
        performSegue(withIdentifier: "detailsEmployee", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsEmployee"{
            if let destination = segue.destination as? DetailsEmployeeController{
                destination.employeeID = employeeID
            }
        }
    }
}
