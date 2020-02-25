//
//  ArticleViewModel.swift
//  NewsMVVM
//
//  Created by Nisha Poddar on 25/02/20.
//  Copyright © 2020 Nisha Poddar. All rights reserved.
//

import Foundation
import UIKit

struct ArticleViewModel{
    var articleVM: Articles
    
    init(_ articles: Articles){
        self.articleVM = articles
    }
    
    var source: Source {
        return articleVM.source!
    }
    
    var author: String {
        return articleVM.author ?? ""
    }
    
    var title: String {
        return articleVM.title ?? ""
    }
    
    var description: String {
        return articleVM.description ?? ""
    }
    
    var publishedAt: String {
        return articleVM.publishedAt ?? ""
    }
    
    var content: String {
        return articleVM.content ?? ""
    }
    
    var url: URL {
        return articleVM.url!
    }

    var urlToImage: URL {
        return articleVM.urlToImage!
    }
    
}

struct ArticleListViewModel{
    var articlesListVM: ArticleList
    
    init(_ articleList: ArticleList){
        self.articlesListVM = articleList
    }
    
    var status: String {
        return articlesListVM.status
    }
    
    var totalResults: Int {
        return articlesListVM.totalResults
    }
    
    var articles: [Articles] {
        return articlesListVM.articles ?? [Articles]()
    }
}
