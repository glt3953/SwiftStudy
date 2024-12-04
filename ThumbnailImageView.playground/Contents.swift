//
//  ThumbnailImageView.swift
//  SwiftStudy
//
//  Created by 宁侠 on 2024/12/3.
//  Copyright © 2024 guoliting. All rights reserved.
//

import SwiftUI

struct ThumbnailImageView: View {
    let thumbnailImage: UIImage
    let fullSizeImageURL: URL = URL(string: "https://images.apple.com/v/imac-with-retina/a/images/overview/5k_image.jpg")!

    @State private var fullSizeImage: UIImage? = nil

    var body: some View {
        ZStack {
            if let fullSizeImage = fullSizeImage {
                Image(uiImage: fullSizeImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(uiImage: thumbnailImage)
                    .resizable()
                    .scaledToFit()
                    .onAppear(perform: loadFullSizeImage)
            }
        }
    }

    private func loadFullSizeImage() {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: fullSizeImageURL),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.fullSizeImage = image
                }
            }
        }
    }
    
    func loadImageWithLowMemoryUsage(url: URL) -> UIImage? {
        guard let source = CGImageSourceCreateWithURL(url as CFURL, nil) else {
            return nil
        }

        let options: [NSString: Any] = [
            kCGImageSourceShouldCache: false, // 避免直接缓存到内存
            kCGImageSourceShouldAllowFloat: true
        ]

        return CGImageSourceCreateImageAtIndex(source, 0, options as CFDictionary).flatMap {
            UIImage(cgImage: $0)
        }
    }
}
