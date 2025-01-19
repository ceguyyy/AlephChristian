//
//  HomePageView.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

struct HomePageView: View {
  @StateObject private var viewModel = HomePageViewModel()
  @State private var searchText = ""
  @State private var isRefreshing = false

  var body: some View {
    NavigationView {
      VStack {
        if viewModel.isLoading {
          ProgressView()
        } else if let errorMessage = viewModel.errorMessage {
          Text(errorMessage).foregroundColor(.red)
        } else {
          VStack {
            List(viewModel.filteredCategories) { category in
              NavigationLink(destination: CategoryItemsPage(category: category)) {
                VStack(alignment: .leading) {
                  Text(category.name).font(.headline)
                  Text("\(category.items.count) items").font(.subheadline)
                }
              }
            }
            Spacer()
          }
          .padding(.top, 0)
          .onChange(of: searchText) { newValue in
            viewModel.searchCategories(query: newValue)
          }
        }
      }
      .onAppear {
        viewModel.fetchCategories()
      }
      .refreshable {
        isRefreshing = true
        await viewModel.refreshData()
        isRefreshing = false

      }
      .searchable(text: $searchText)
      .navigationTitle("Categories")
    }
  }
}

#Preview {
  HomePageView()
}
