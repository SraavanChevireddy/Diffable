//
//  APIManager.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import Foundation
enum AppErrors: Error {
    case badURL
    case serverError
    case parsingError
    case emptyInfo
    
    //Error Messages
    
    var detail: String {
        switch self {
        case .badURL:
             return "The URl that we are trying to fetch is improper"
        case .serverError:
             return "Failed to fetch data from server"
        case .parsingError:
            return "Error in parsing the json data"
        case .emptyInfo:
            return "The movie name cant be empty"
        }
    }
}

class ApiManager {
    static let manager = ApiManager()
    let session = URLSession.shared
    private init() {}
    //Network Call
//    func getData(completion:@escaping (Result<EmployeeInfoModel, NetworkErrors>) -> Void) {
//
//        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
//            completion(.failure(NetworkErrors.))
//            return
//        }
//
//        session.dataTask(with: url) { (data, response, error) in
//            if let _ = error {
//                completion(.failure(.parsingError))
//                return
//            }
//
//            if let receivedData = data {
//                do  {
//                    let employeeDetails = try JSONDecoder().decode(EmployeeInfoModel.self, from: receivedData)
//                    print("details:\(employeeDetails)")
//                    completion(.success(employeeDetails))
//                } catch  {
//                    print(error.localizedDescription)
//                    completion(.failure(.serverError))
//                }
//            }
//        }.resume()
//    }
 
 /*
    // Downloading the image
     func downloadImage(url: String, completionHandler: @escaping (Result<(Data, String), AppErrors>) -> Void) {
         guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(url)") else {
             completionHandler(.failure(.badURL))
             return
         }
         
         session.dataTask(with: imageUrl) { (receivedData, receivedResponse, receivedError) in
             if let data = receivedData {
                 completionHandler(.success((data, url)))
             } else {
                 completionHandler(.failure(.serverError))
             }
         }.resume()
     }
  */
}
