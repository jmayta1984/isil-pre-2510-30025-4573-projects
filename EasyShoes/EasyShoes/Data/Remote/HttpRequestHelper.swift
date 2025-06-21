//
//  HttpRequestHelper.swift
//  EasyShoes
//
//  Created by Alumno on 30/05/25.
//

import Foundation

class HttpRequestHelper {
        
    func GET(url: String, completion:  @escaping(Data?, String?) -> Void ){
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Error: problem calling GET")
                completion(nil, "Error: problem calling GET")
                return
            }
            
            guard let data = data else {
                print("Error: no data")
                completion(nil, "Error: no data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: HTTP request failed")
                completion(nil, "Error: HTTP request failed")
                return
            }
            completion(data, nil)
        }.resume()
        
    }
    
    func POST<T: Encodable>(url: String, body: T, completion: @escaping(Data?, String?) -> Void )  {
        
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let data = try JSONEncoder().encode(body)
            urlRequest.httpBody = data
        } catch let encodingError {
            print("Error: \(encodingError)")
            completion(nil, "Error: \(encodingError)" )
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                print("Error: problem calling POST")
                completion(nil, "Error: problem calling POST")
                return
            }
            
            guard let data = data else {
                print("Error: no data")
                completion(nil, "Error: no data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...201 ~= response.statusCode  else {
                print("Error: HTTP request failed")
                completion(nil, "Error: HTTP request failed")
                return
            }
            completion(data, nil)
        }.resume()
        
    }
}
