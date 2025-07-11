//
//  RequestManager.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

//This class is used to handle request like GET and POST.
struct RequestManager {
    
    static let shared = RequestManager()
    
    func getData<T: Codable>(url: URL) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkErrors.invalidResponse
            }
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkErrors.decodingError(error)
            }
        } catch {
            throw NetworkErrors.serverError
        }
        
    }
}


enum NetworkErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case serverError
    case decodingError(Error)
}
