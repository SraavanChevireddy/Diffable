//
//  EmployeeInfoViewController.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import UIKit

class EmployeeInfoViewController: UIViewController, EmployeeViewModelDelegate {
    
    @IBOutlet weak var employeeList: UITableView!
    var sort : sort!
    
    var viewModel = EmployeeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchEmployeeInformation()
        viewModel.delegate = self
        employeeList.delegate = self
        employeeList.dataSource = self
    }
    
    
    var dataSource: UITableViewDiffableDataSource<Section, Item>! = nil
    private var imageObjects = [Item]()
    
    
    func refresh(){
        viewModel.fetchEmployeeInformation()
    }
    
    func update(with error: NetworkErrors?) {
        employeeList.reloadData()
        viewModel.results = viewModel.results.sorted(by: { $0.fullName > $1.fullName })
    }

}
extension EmployeeInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeList.dequeueReusableCell(withIdentifier: "detailsTableView", for: indexPath) as? EmployeeListTableViewCell else {
            return UITableViewCell()
        }
        cell.empInfo = viewModel.results[indexPath.row]
        return cell
    }
}


enum sort{
    case aToZ
    case zToA
}
