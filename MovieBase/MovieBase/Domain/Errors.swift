//
//  Errors.swift
//  MovieBase
//
//  Created by Ajin on 09/08/24.
//

import Foundation

enum MovieBaseErrors: String, Error{
    case invalidAccess = "Invalid token"
    case networkTimeout = "The network request is timed out"
    case noNetwork = "Unable to connect to network"
    case databaseError = "Unable to fetch data from storage"
    case conversionError = "Type conversion error"
}
