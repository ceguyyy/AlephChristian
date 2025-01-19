//
//  NetworkManager.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

class NetworkManager {
  static let shared = NetworkManager()
  private init() {}

  private let baseURL = Constant.baseURLDev

  private func constructURL(with path: String) -> URL? {
    return URL(string: baseURL)?.appendingPathComponent(path)
  }

  func fetchData<T: Decodable>(
    from path: String,
    responseType: T.Type,
    completion: @escaping (Result<T, Error>) -> Void
  ) {
    guard let url = constructURL(with: path) else {
      completion(.failure(NetworkError.serverError("Invalid URL for path: \(path)")))
      return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(NetworkError.unknown(error)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode)
      else {
        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        completion(.failure(NetworkError.serverError("HTTP Status Code: \(statusCode)")))
        return
      }

      guard let data = data else {
        completion(.failure(NetworkError.noData))
        return
      }

      do {
        let decodedResponse = try JSONDecoder().decode(BaseResponse<T>.self, from: data)
        completion(.success(decodedResponse.data))
      } catch {
        completion(.failure(NetworkError.decodingError(error.localizedDescription)))
      }
    }.resume()
  }
}
