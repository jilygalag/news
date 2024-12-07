//
//  NewsListViewController.swift
//  News
//
//  Created by Juliana Galag on 12/7/24.
//
import UIKit
import SnapKit
import SDWebImage

class NewsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private let viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        setupTableView()
        setupBindings()
        viewModel.loadNews()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NewsCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }

    private func setupBindings() {
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.onError = { [weak self] error in
            self?.showErrorAlert(message: error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        let newsItem = viewModel.newsItem(at: indexPath.row)
        cell.textLabel?.text = newsItem.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetailVC = NewsDetailViewController(news: viewModel.newsItem(at: indexPath.row))
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

