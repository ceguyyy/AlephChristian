//
//  ItemDetailPage.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

struct ItemDetailPage: View {
  let item: Item

  @State private var isRefreshing = false

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {

        CacheImage(imageURL: item.image_url).aspectRatio(contentMode: .fit)
          .frame(maxWidth: .infinity)

        Text(item.title).font(.largeTitle).bold()

        Text("By \(item.details.author)")
          .font(.headline)
          .foregroundColor(.secondary)

        Text("Published on \(item.details.published_date)")
          .font(.subheadline)
          .foregroundColor(.secondary)

        Text(item.description).font(.body)

        Text("Tags")
          .font(.headline)
          .padding(.top)

        HStack {
          ForEach(item.details.tags, id: \.self) { tag in
            Text("#\(tag)")
              .font(.caption)
              .padding(8)
              .background(Color.gray.opacity(0.2))
              .clipShape(Capsule())
          }
        }
      }
      .padding()
    }
    .navigationTitle(item.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  ItemDetailPage(
    item: Item(
      id: 1, title: "item1", description: "desc1",
      image_url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Image-missing.svg/96px-Image-missing.svg.png",
      details: ItemDetails(
        author: "Christian", published_date: "2024-1-1", tags: ["tag1", "tag2", "tag3"])))
}
