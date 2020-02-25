//
//  ViewController.swift
//  NewsMVVM
//
//  Created by Nisha Poddar on 25/02/20.
//  Copyright © 2020 Nisha Poddar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let identifier = "ViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    var courseListViewModel : CourseViewModel!
    var articleListViewModel : ArticleListViewModel!
    var articlesViewModel : [ArticleViewModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.populateNews()
        }
    }
    
    func populateNews(){
        //        let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/course")!
        let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&apiKey=c05b9d1cf27541c9821201bfa08473b2")!
        
        _ = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                let json = try? JSONDecoder().decode(ArticleList.self, from: data!)
                self.articleListViewModel = json.map({return ArticleListViewModel($0)})
                self.articlesViewModel = json?.articles?.map{return ArticleViewModel($0)}
                if self.articlesViewModel != nil {
                    DispatchQueue.main.async {
                        self.tableView.delegate = self
                        self.tableView.dataSource = self
                        self.tableView.reloadData()
                    }
                }
            }
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! Cell
        cell.articleObject = self.articlesViewModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: DetailsViewController.identifier) as! DetailsViewController
        vc.articleToPass = self.articlesViewModel[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class Cell: UITableViewCell {
    static let identifier = "cell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var articleObject : ArticleViewModel! {
        didSet {
            titleLabel.text = articleObject.title
            descriptionLabel.text = articleObject.description
        }
    }
}
