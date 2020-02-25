//
//  DetailsViewController.swift
//  NewsMVVM
//
//  Created by Nisha Poddar on 25/02/20.
//  Copyright © 2020 Nisha Poddar. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
    static let identifier = "DetailsViewController"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var articleToPass: ArticleViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = articleToPass.title
        newsImageView.af.setImage(withURL: articleToPass.urlToImage)
    }


}
