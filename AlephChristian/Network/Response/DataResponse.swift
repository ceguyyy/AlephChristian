//
//  DataResponse.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

struct DataResponse: Codable {
  let categories: [Category]
}

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let items: [Item]
}
