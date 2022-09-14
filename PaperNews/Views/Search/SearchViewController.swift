//
//  SearchViewController.swift
//  PaperNews
//
//  Created by pc on 9.09.2022.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController {
    
    private var articles: [Article] = []
    private var newsService: NewsServiceProtocol = NewsService()
    private var alertManager = AlertManager()
    var queryTopic: String?
    lazy var searchVC = UISearchController(searchResultsController: nil)
    private var searchNewsTimer: Timer?
    
    @IBOutlet weak var searchedNewsCollectionView: UICollectionView! {
        didSet {
            searchedNewsCollectionView.dataSource = self
            searchedNewsCollectionView.delegate = self
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.headerReferenceSize = CGSize(width: 0, height: 0)
            searchedNewsCollectionView.collectionViewLayout = layout
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchBar()
        getNews()
    }
    
    func initSearchBar() {
        navigationItem.searchController = searchVC
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.placeholder = "Search News.."
        searchVC.searchBar.delegate = self
    }
    
    func getNews() {
        showSpinner(onView: self.view)
        newsService.fetchNews() { [weak self] result in
            switch result {
            case .success(let response):
                self?.articles = response.articles ?? []
                self?.searchedNewsCollectionView.reloadData()
                self?.removeSpinner()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSearchedNews(searchQuery: String) {
        showSpinner(onView: self.view)
        newsService.searchNews(searchQuery: searchQuery) { [weak self] result in
            switch result {
            case .success(let response):
                self?.articles = response.articles ?? []
                self?.searchedNewsCollectionView.reloadData()
                self?.removeSpinner()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func directToURL(url: String) {
        guard let url = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
//MARK: -CollectionView DataSource & Delegate Methods
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        let article = articles[indexPath.row]
        cell.configure(article: article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let homepageURL = article.url!
        directToURL(url: homepageURL)
    }
}

//MARK: -SearchBar Delegate Methods
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if let timer = searchNewsTimer {
            timer.invalidate()
        }
        searchNewsTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.startSearch(_:)), userInfo: text, repeats: false)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        getNews()
    }

    @objc func startSearch(_ timer: Timer) {
        if let searchText = timer.userInfo as? String {
            getSearchedNews(searchQuery: searchText)
        }
    }
}
//MARK: -SearchBar DelegateFlowLayout Methods
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 25.0)
    }
}


