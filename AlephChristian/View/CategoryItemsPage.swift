//
//  CategoryItemsPage.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

struct CategoryItemsPage: View {
  let category: Category
  @StateObject private var viewModel = CategoryItemsViewModel()
  @State private var isRefreshing = false
  @State private var searchText = ""

  var body: some View {
    VStack {
      List(viewModel.filteredItems) { item in
        NavigationLink(destination: ItemDetailPage(item: item)) {
          HStack {
            AsyncImage(url: URL(string: item.image_url)) { image in
              image.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
              ProgressView()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack(alignment: .leading) {
              Text(item.title).font(.headline)
              Text(item.description).font(.subheadline).lineLimit(2)
            }
          }
        }
      }
      .refreshable {
        isRefreshing = true
        await viewModel.refreshData()
        isRefreshing = false
      }
      .searchable(text: $searchText)
      .onChange(of: searchText) { newValue in
        viewModel.searchItems(query: newValue)
      }
      .onAppear {
        viewModel.setCategory(category)
      }
    }
  }
}

#Preview {
  CategoryItemsPage(
    category: Category(
      id: 1, name: "Categories 1",
      items: [
        Item(
          id: 1, title: "Item 1", description: "Desc 1",
          image_url:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Image-missing.svg/96px-Image-missing.svg.png",
          details: ItemDetails(
            author: "Christian", published_date: "2024-1-1", tags: ["tags1", "tags2", "tags3"]))
      ]))
}
