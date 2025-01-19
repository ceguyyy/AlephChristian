//
//  NetworkError.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

enum NetworkError: Error, LocalizedError {
  case invalidURL
  case noData
  case decodingError(String)
  case serverError(String)
  case unknown(Error)

  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "The URL provided is invalid."
    case .noData:
      return "No data received from the server."
    case .decodingError(let message):
      return "Failed to decode the response: \(message)"
    case .serverError(let message):
      return "Server error: \(message)"
    case .unknown(let error):
      return "An unknown error occurred: \(error.localizedDescription)"
    }
  }
}
