//
//  NetworkWorker.swift
//  PlateMate
//
//  Created by HE Siyao on 4/2/2023.
//

import Foundation
import UIKit

public class NetworkWorker{
    
    static private let host : String = "20.14.97.80"
    
    static func search(keyword: String, completion : @escaping (Result<[Recipe], Error>) -> Void){
        var components = URLComponents()
            components.scheme = "http"
            components.host = "20.14.97.80"
        components.port = 80
            components.path = "/search"
            components.queryItems = [
                URLQueryItem(name: "keyword", value: keyword)
            ]
        let url = components.url!
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let result = processJsonSearchResponse(fromJSON: data!)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    static func processJsonSearchResponse(fromJSON data: Data) -> Result<[Recipe], Error> {
        var result : [Recipe] = []
        do{

            let response : searchResponse = try JSONDecoder().decode(searchResponse.self, from: data)
            for single_response in response.list{
                let single_result = Recipe(name: single_response.title, id: single_response.id, imageUrl: URL(string: single_response.image_url)!, ingredients: nil)
                result.append(single_result)
                print(single_result.name)
            }
            return .success(result)
        }catch{
                return .failure(error)
        }
    }
    
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

struct singleResponse : Codable{
    public let recipe: String
    public let ingredients: [String]
    public let image: String
    public let id: String
}

struct searchResponse: Codable{
    let list: [searchSingleResponse]
}

struct searchSingleResponse: Codable{
    let title: String
    let image_url: String
    let id: String
}

/// Success handler.
public typealias SuccessHandler<T> = (_ data: T) -> Void

/// Failure handler.
public typealias FailureHandler = (_ error: Error) -> Void

