//
//  CacheImage.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import SwiftUI

struct CacheImage: View {
  @State private var image: UIImage? = nil
  let imageURL: String
  let url: URL?

  init(imageURL: String) {
    self.imageURL = imageURL
    self.url = URL(string: imageURL)
  }

  var body: some View {
    VStack {
      if let image = image {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 200, height: 200)
          .cornerRadius(8)
      } else {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .frame(width: 100, height: 100)
      }
    }
    .onAppear {
      if let url = url {
        loadImage(from: url)
      }
    }
  }

  private func loadImage(from url: URL) {
    ImageCacheManager.shared.loadImage(from: url) { fetchedImage in
      self.image = fetchedImage
    }
  }
}
#Preview {
  CacheImage(
    imageURL:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Image-missing.svg/96px-Image-missing.svg.png"
  )
}
