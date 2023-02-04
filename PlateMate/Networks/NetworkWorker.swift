//
//  NetworkWorker.swift
//  PlateMate
//
//  Created by HE Siyao on 4/2/2023.
//

import Foundation
import UIKit

public class NetworkWorker{
    
    static func loadUrlToImage(imageView: UIImageView, from url: URL) {
        imageView.contentMode = .scaleAspectFit
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { imageView.image = image
                }
            }.resume()
        }
}
