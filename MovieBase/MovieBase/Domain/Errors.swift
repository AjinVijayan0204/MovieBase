//
//  Errors.swift
//  MovieBase
//
//  Created by Ajin on 09/08/24.
//

import Foundation

enum MovieBaseErrors: Error{
    case invalidAccess
    case networkTimeout
    case noNetwork
    case databaseError
}
