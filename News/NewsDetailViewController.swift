//
//  NewsDetailViewController.swift
//  News
//
//  Created by Juliana Galag on 12/7/24.
//
import UIKit
import SnapKit

class NewsDetailViewController: UIViewController {
    private let news: News
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 1
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    private lazy var publishedAtLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    init(news: News) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        #if DEBUG
        fatalError("init(coder:) has not been implemented")
        #endif
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureData()
    }
    
    private func configureData() {
        title = news.title
        image.sd_setImage(with: URL(string: news.image), placeholderImage: UIImage(named: "Placeholder"))
        titleLabel.text = news.title
        publishedAtLabel.text = news.publishedAt
        descriptionLabel.text = news.content
    }
    
    private func setupViews() {
        let contentView = UIView()
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(publishedAtLabel)
        contentView.addSubview(descriptionLabel)
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(400)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        
        publishedAtLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(publishedAtLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
