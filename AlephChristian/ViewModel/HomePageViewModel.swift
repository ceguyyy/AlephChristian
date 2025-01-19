//
//  HomePageViewModel.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import Foundation

class HomePageViewModel: ObservableObject {
  @Published var categories: [Category] = []
  @Published var filteredCategories: [Category] = []
  @Published var isLoading = true
  @Published var errorMessage: String?

  func fetchCategories() {
    guard let url = URL(string: Constant.baseURLDev) else { return }
    let path = Constant.baseURLProdPath
    NetworkManager.shared.fetchData(from: path, responseType: DataResponse.self) { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let response):
          self.categories = response.categories
          self.filteredCategories = response.categories
        case .failure(let error):
          self.errorMessage = error.localizedDescription
        }
        self.isLoading = false
      }
    }
  }

  func searchCategories(query: String) {
    if query.isEmpty {
      filteredCategories = categories
    } else {
      filteredCategories = categories.filter { category in
        category.name.lowercased().contains(query.lowercased())
      }
    }
  }

  func refreshData() async {
    fetchCategories()
    try? await Task.sleep(nanoseconds: 1_000_000_000)
  }
}
