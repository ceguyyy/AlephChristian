//
//  BaseResponse.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
  let status: String
  let data: T
  let metadata: Metadata
}

struct Metadata: Decodable {
  let total_categories: Int
  let total_items: Int
  let request_time: String

}
