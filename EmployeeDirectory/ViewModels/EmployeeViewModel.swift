//
//  EmployeeViewModel.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import Foundation
// View Model
protocol EmployeeViewModelDelegate: AnyObject {
    func update(with error: NetworkErrors?)
}

class EmployeeViewModel {
    var results = [Employee]()
    weak var delegate: EmployeeViewModelDelegate?

    func fetchEmployeeInformation(){
        NetworkLayer.standard.request(to: .get, controller: Controllers.employeeInformation.rawValue, downCase: EmployeeInfoModel.self) {  response in
            DispatchQueue.main.async {
                switch response {
                case .success(let employeeData):
                    self.results = employeeData.employees
                    self.delegate?.update(with: nil)
                case .failure(let error):
                    self.delegate?.update(with: error)
                }
            }
        }
    }
}
