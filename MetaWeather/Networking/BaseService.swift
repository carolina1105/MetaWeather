//
//  BaseServices.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation
import Alamofire

class BaseService {
    func sendRequest<T: Decodable>(_ endpoint: String, of: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let request = AF.request(endpoint, method: .get)
        request
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self, queue: .global(qos: .background)) { response in
                if let error = response.error {
                    print(error)
                    completion(.failure(.genericError))
                    return
                }
                let validationResult = response.result
                switch validationResult {
                case .success(let object):
                    completion(.success(object))
                    break
                case .failure(let error):
                    print(error)
                    completion(.failure(.genericError))
                    break
                }
        }
    }
}
