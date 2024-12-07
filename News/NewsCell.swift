//
//  NewsCell.swift
//  News
//
//  Created by Juliana Galag on 12/7/24.
//
import UIKit
import SnapKit
import SDWebImage

class NewsCell: UITableViewCell {
    
    static let identifier = "NewsCell"

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
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
        label.numberOfLines = 2
        return label
    }()

    private lazy var publishedAtLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    func configure(with news: News) {
        titleLabel.text = news.title
        descriptionLabel.text = news.content
        image.sd_setImage(with: URL(string: news.image), placeholderImage: UIImage(named: "Placeholder"))
        publishedAtLabel.text = news.publishedAt
    }

    private func setupViews() {
        selectionStyle = .none
        
        let view = UIView()
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(publishedAtLabel)
        
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        image.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.height.width.equalTo(150)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(8)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(8)
        }

        publishedAtLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.bottom.trailing.equalToSuperview()
        }
    }

}
