//
//  Webservice.swift
//  MovieBase
//
//  Created by Ajin on 14/07/24.
//

import Foundation

class WebService{
    
    let appConfig = Config()
    
    func makeRequest(for url: String, queryItems: [URLQueryItem]) async throws-> Data{
        let baseUrl = appConfig.appUrl
        guard let fullUrl = URL(string: baseUrl + url) else { return Data() }
        var components = URLComponents(url: fullUrl, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = queryItems
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let authorisation = "Bearer" + appConfig.apiKey
        var request = URLRequest(url: components.url!)
        request.httpMethod = RequestMethod.get.rawValue
        request.timeoutInterval = 1
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": authorisation
          ]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}

enum RequestMethod: String{
    case post = "POST"
    case get = "GET"
    case put = "PUT"
}
