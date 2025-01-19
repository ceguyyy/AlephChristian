//
//  CategoryItemsViewModel.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

class CategoryItemsViewModel: ObservableObject {
  @Published var items: [Item] = []
  @Published var filteredItems: [Item] = []
  @Published var selectedCategory: Category?

  func setCategory(_ category: Category) {
    self.selectedCategory = category
    self.items = category.items
    self.filteredItems = category.items
  }

  func refreshData() async {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
  }

  func searchItems(query: String) {
    if query.isEmpty {
      filteredItems = items
    } else {
      filteredItems = items.filter { $0.title.lowercased().contains(query.lowercased()) }
    }
  }

  func loadImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
    ImageCacheManager.shared.loadImage(from: url, completion: completion)
  }
}
