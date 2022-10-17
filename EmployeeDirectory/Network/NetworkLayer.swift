//
//  NetworkLayer.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif


class NetworkLayer: NSObject,URLSessionDelegate, URLSessionTaskDelegate{
    
    static let standard = NetworkLayer()
    
    func request<T:Decodable>(to: requestType, controller: String,downCase as:T.Type,completion:@escaping(Result<T, NetworkErrors>)->Void) where T:Decodable{
        
        let constructor = ApplicationEnvironment.developmentEnvironment.rawValue + controller
        guard let url = URL(string: constructor) else{
            debugPrint("Host not found")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = to.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let socketRequest = URLSession.shared.dataTask(with: request) { (data, response, networkErr) in
            
            // Check for the status of request
            if let httpResponse = response as? HTTPURLResponse{
                
                // Status Ok 😉
                if httpResponse.statusCode == responseCode.ok.rawValue{
                    print("Entreat Completed Successfully!")
                    if let data = data{
                        do{
                            let result = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(result))
                        }catch{
                            print("Response successful. But unable to decode the data!"+error.localizedDescription)
                            debugPrint(error)
                        }
                    }
                }else if httpResponse.statusCode == responseCode.noUserSession.rawValue{
                    completion(.failure(.noResponse))
                }
                else{
                    completion(.failure(.noResponse))
                    debugPrint("FAILED")
                }
            }
            
        }
        socketRequest.resume()
    }
}

enum requestType : String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum responseCode:Int{
    case ok = 200
    case badRequest  = 400
    case noUserSession = 401
    case notFound = 404
    case internalError = 500
}
