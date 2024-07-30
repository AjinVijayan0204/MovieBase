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
        let authorisation = "?api_key=\(appConfig.apiKey)"
        
        guard let fullUrl = URL(string: baseUrl + url + authorisation) else { return Data() }
        var components = URLComponents(url: fullUrl, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = queryItems
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = RequestMethod.get.rawValue
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json"
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
