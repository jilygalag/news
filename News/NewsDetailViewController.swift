//
//  NewsDetailViewController.swift
//  News
//
//  Created by Juliana Galag on 12/7/24.
//
import UIKit

class NewsDetailViewController: UIViewController {
    private let news: News
    
    init(news: News) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = news.title
        titleLabel.frame = CGRect(x: 16, y: 100, width: view.bounds.width - 32, height: 50)
        view.addSubview(titleLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = news.content
        descriptionLabel.frame = CGRect(x: 16, y: 160, width: view.bounds.width - 32, height: 200)
        view.addSubview(descriptionLabel)
    }
}
