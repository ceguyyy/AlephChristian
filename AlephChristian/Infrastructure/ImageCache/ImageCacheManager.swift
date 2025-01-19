//
//  ImageCacheManager.swift
//  AlephChristian
//
//  Created by Christian Gunawan on 19/01/25.
//

import UIKit

class ImageCacheManager {
  static let shared = ImageCacheManager()
  private let cache = NSCache<NSString, UIImage>()

  private init() {}

  func getImage(for url: URL) -> UIImage? {
    return cache.object(forKey: url.absoluteString as NSString)
  }

  func saveImage(_ image: UIImage, for url: URL) {
    cache.setObject(image, forKey: url.absoluteString as NSString)
  }

  func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
    if let cachedImage = getImage(for: url) {
      completion(cachedImage)
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      if let data = data, let image = UIImage(data: data) {
        self.saveImage(image, for: url)
        DispatchQueue.main.async {
          completion(image)
        }
      } else {
        DispatchQueue.main.async {
          completion(nil)
        }
      }
    }
    task.resume()
  }
}
