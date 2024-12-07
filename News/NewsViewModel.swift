//
//  NewsViewModel.swift
//  News
//
//  Created by Juliana Galag on 12/7/24.
//
import Foundation

class NewsViewModel {
    var news: [News] = []
    var onUpdate: (() -> Void)?
    var onError: ((String) -> Void)?

    private let newsService = NewsService()
    
    func loadNews() {
        newsService.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.news = articles
                    self?.onUpdate?()
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
    
    func newsItem(at index: Int) -> News {
        return news[index]
    }
}
