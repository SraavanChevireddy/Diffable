//
//  NetworkErrors.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/14/22.
//

import Foundation
enum NetworkErrors : Error{
    case noResponse

    var localizedDescription: String{
        switch self{
        case .noResponse:
            return  NSLocalizedString("Unable to get the response from host", comment: "requestError")
        }
    }
}
