//
//  Item.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

struct Item: Codable, Identifiable {
  let id: Int
  let title: String
  let description: String
  let image_url: String
  let details: ItemDetails
}

struct ItemDetails: Codable {
  let author: String
  let published_date: String
  let tags: [String]
}
