//
//  WebService.swift
//  NewsPaperApi
//
//  Created by Mesut Aygün on 14.05.2021.
//

import Foundation

class WebService {
    
static let shared = WebService()
    
    struct UrlService {
        static let topHeadlinesUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=40ed902363924261af9d1ccf140e092f")
    }
    
    private init() {}
    
    public func getNewsStories(completion : @escaping (Result<[Articles],Error>) -> Void) {
        
        guard let url = UrlService.topHeadlinesUrl else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ArticlesInfo.self, from: data)
                    print("articles : \(result.articles.count)")
                    completion(.success(result.articles))
                }catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

    
    
    
    
}
