//
//  NewsService.swift
//  News
//
//  Created by Juliana Galag on 12/7/24.
//
import Foundation
import Alamofire

class NewsService {
    func fetchNews(completion: @escaping (Result<[News], Error>) -> Void) {
        let url = "https://jsonplaceholder.org/posts" // Replace with the actual API URL
        
        AF.request(url).validate().responseDecodable(of: [News].self) { response in
            switch response.result {
            case .success(let news):
                completion(.success(news))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
