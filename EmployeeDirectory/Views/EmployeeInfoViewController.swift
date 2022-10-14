//
//  EmployeeInfoViewController.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import UIKit

class EmployeeInfoViewController: UIViewController, EmployeeViewModelDelegate {
    
    @IBOutlet weak var employeeList: UITableView!
    var viewModel = EmployeeViewModel()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("\(viewModel.fetchData())")
//    }
    var dataSource: UITableViewDiffableDataSource<Section, Item>! = nil
    private var imageObjects = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchEmployeeInformation()
        
        dataSource = UITableViewDiffableDataSource<Section, Item>(tableView: employeeList) {
            (tableView: UITableView, indexPath: IndexPath, item: Item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsTableView", for: indexPath)
            /// - Tag: update
            var content = cell.defaultContentConfiguration()
            content.image = item.image
            ImageCache.publicCache.load(url: item.url as NSURL, item: item) { (fetchedItem, image) in
                if let img = image, img != fetchedItem.image {
                    var updatedSnapshot = self.dataSource.snapshot()
                    if let datasourceIndex = updatedSnapshot.indexOfItem(fetchedItem) {
                        let item = self.imageObjects[datasourceIndex]
                        item.image = img
                        updatedSnapshot.reloadItems([item])
                        self.dataSource.apply(updatedSnapshot, animatingDifferences: true)
                    }
                }
            }
            cell.contentConfiguration = content
            return cell
        }
        
        self.dataSource.defaultRowAnimation = .fade
        
        // Get our image URLs for processing.
        if imageObjects.isEmpty {
                for index in 1...100 {
                    if let url = Bundle.main.url(forResource: "UIImage_\(index)", withExtension: "png") {
                        self.imageObjects.append(Item(image: ImageCache.publicCache.placeholderImage, url: url))
                    }
                }
                var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Item>()
                initialSnapshot.appendSections([.main])
                initialSnapshot.appendItems(self.imageObjects)
                self.dataSource.apply(initialSnapshot, animatingDifferences: true)
        }
    }
    
    func update(with error: NetworkErrors?) {
        employeeList.reloadData()
    }
}
//extension EmployeeInfoViewController: UITableViewDataSource {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return viewModel.results.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = employeeList.dequeueReusableCell(withIdentifier: "detailsTableView", for: indexPath) as? EmployeeListTableViewCell else {
////            return UITableViewCell()
////        }
////        cell.empInfo = viewModel.results[indexPath.row]
////        return cell
////    }
////
////    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
////
////    }
//}

extension EmployeeInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
