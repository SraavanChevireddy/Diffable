//
//  ImageItem.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/14/22.
//

import UIKit

enum Section {
    case main
}

class Item: Hashable {
    
    var image: UIImage!
    let url: URL!
    let identifier = UUID()
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(image: UIImage, url: URL) {
        self.image = image
        self.url = url
    }
}
