//
//  NewsViewController.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    
    private var articles: [Article] = []
    private var newsService: NewsServiceProtocol = NewsService()
    private var alertManager = AlertManager()
    var queryTopic: String?
    
    @IBOutlet weak var newsCollectionView: UICollectionView! {
        didSet {
            newsCollectionView.dataSource = self
            newsCollectionView.delegate = self
            newsCollectionView.register(
                NewsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsCollectionReusableView.identifier
            )
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.headerReferenceSize = CGSize(width: 0, height: 100)
            newsCollectionView.collectionViewLayout = layout
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
    }

    func getNews() {
        showSpinner(onView: self.view)
        if let topic = queryTopic {
            let lowercasedTopic = topic.lowercased()
            newsService.fetchTopHeadlines(topic: lowercasedTopic) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.articles = response.articles ?? []
                    self?.newsCollectionView.reloadData()
                    self?.removeSpinner()
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            if let currentNavigationController = self.navigationController {
                alertManager.createAlert(alertTitle: "Alert!", alertMessage: "Something went wrong..", buttonTitle: "OK", navigationController: currentNavigationController, viewController: self)
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
extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let article = articles[indexPath.row]
        cell.configure(article: article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let homepageURL = article.url!
        directToURL(url: homepageURL)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsCollectionReusableView.identifier, for: indexPath) as! NewsCollectionReusableView
        header.label.text = queryTopic
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width / 6)
    }
}
//MARK: -SearchBar DelegateFlowLayout Methods
extension NewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width/2-20, height: (width/2) * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 20.0)
    }
}


