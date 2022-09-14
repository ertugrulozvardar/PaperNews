//
//  HeadlinesViewController.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import UIKit

class HeadlinesViewController: UIViewController {

    @IBOutlet weak var headlinesTableView: UITableView! {
        didSet {
            headlinesTableView.delegate = self
            headlinesTableView.dataSource = self
            headlinesTableView.register(UINib(nibName: String(describing: HeadlinesTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeadlinesTableViewCell.self))
        }
    }
    
    var headlines: [String] = [getHeadline(topic: .breakingNews), getHeadline(topic: .world), getHeadline(topic: .nation), getHeadline(topic: .science), getHeadline(topic: .technology), getHeadline(topic: .sports), getHeadline(topic: .entertainment), getHeadline(topic: .business), getHeadline(topic: .health)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//MARK: -TableView Delegate & DataSource Methods
extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeadlinesTableViewCell.self), for: indexPath) as! HeadlinesTableViewCell
        let headlineTopic = headlines[indexPath.row]
        cell.configure(topic: headlineTopic)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let newsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: NewsViewController.self)) as? NewsViewController {
            newsVC.queryTopic = headlines[indexPath.row].description
            self.navigationController?.pushViewController(newsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
